-- Verify pgrest1:appschema on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('film', 'usage');

ROLLBACK;
