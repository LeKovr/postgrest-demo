echo "Waiting for network startup..."
while true; do ping -c1 $PG_HOST > /dev/null 2>&1 && break; done

# Get vendor data
echo "Getting vendor data..."
pushd vendor
N=ng-admin-postgrest 
[ -d $N ] || {
  git clone https://github.com/marmelab/$N.git
  pushd $N
  patch -p1 < ../$N.diff
  popd
}

N=postgrest-example
[ -d $N ] || {
  git clone https://github.com/begriffs/$N.git
  cp sqitch.conf $N
}

N=swagger-ui
[ -d $N ] || {
  git clone https://github.com/swagger-api/swagger-ui.git
}
popd

# Make symlinks
[ -L www/adm ] || ln -s ../vendor/ng-admin-postgrest www/adm
[ -L www/ui ] || ln -s ../vendor/swagger-ui/dist www/ui

echo "Setup adm..."
pushd www/adm
echo n | bower install --allow-root
popd

#TODO: solve this
PGPASSWORD=op psql -h $PG_HOST -U op $DB_NAME -c "create extension if not exists sslinfo;"

echo "Deploy database with sqitch"
pushd vendor/postgrest-example
sqitch target alter production --uri=db:pg://$DB_NAME:$DB_PASS@$PG_HOST:5432/$DB_NAME
sqitch deploy
popd
echo "Done"
