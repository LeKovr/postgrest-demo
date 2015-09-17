-- Revert pgrest1:v1schema from pg

BEGIN;

DROP SCHEMA "1";

COMMIT;
