# Lang


## Setup & install

- Prepare the Database
  - Postgres 9+
  - `create role lang  with login superuser;`
  - `create database lang_development with owner lang;`
  - `create database lang_test with owner lang;`
  - Make sure it works: `$ psql -U lang lang_development` should log you in.

## Populate the database

- `rake db:seed` Loads my seeded data & pulls from Wikipedia
