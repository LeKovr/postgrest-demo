-- Revert pgrest1:appschema from pg

BEGIN;

DROP SCHEMA film;

COMMIT;
