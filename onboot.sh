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
  # setup angularjs
  echo n | bower install --allow-root
  popd
}
N1=ng-admin-postgrest1
[ -d $N1 ] || {
  cp -lr $N $N1
  patch -p0 < $N1.diff
}

N=postgrest-example
[ -d $N ] || {
  git clone https://github.com/begriffs/$N.git
  patch -p0 < $N.diff
}

N=swagger-ui
[ -d $N ] || {
  git clone https://github.com/swagger-api/swagger-ui.git
}
popd

# Make symlinks
[ -L www/adm ] || ln -s ../vendor/ng-admin-postgrest www/adm
[ -L www/adm1 ] || ln -s ../vendor/ng-admin-postgrest1 www/adm1
[ -L www/ui ] || ln -s ../vendor/swagger-ui/dist www/ui

echo "Deploy database with sqitch"
pushd vendor/postgrest-example
sqitch target alter production --uri=db:pg://$DB_NAME:$DB_PASS@$PG_HOST:5432/$DB_NAME
sqitch deploy
popd
echo "Done"
