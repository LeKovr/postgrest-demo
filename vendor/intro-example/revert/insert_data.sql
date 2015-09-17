-- Revert pgrest1:insert_data from pg

BEGIN;

-- XXX Add DDLs here.
DELETE FROM film.director;
DELETE FROM film.film;
DELETE FROM film.festival;
DELETE FROM film.competition;
DELETE FROM film.nominations;

COMMIT;
