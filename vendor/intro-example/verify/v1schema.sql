-- Verify pgrest1:v1schema on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('1', 'usage');

ROLLBACK;
