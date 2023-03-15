# Rails Boilerplate

## Features

This template comes with:
- Schema
  - Users table
- Endpoints
  - Sign up with user credentials
  - Sign in with user credentials
  - Sign out

## Prerequisite
- Ruby 3.1.1
- Postgresql >= 9.6

## How to use

1. Clone this repo
2. Install PostgreSQL
3. Update `config/application.yml` configuration.
4. Generate a secret key with `rails secret` and paste this value into the `application.yml`.
5. `rails db:setup`
6. `rails s`
7. You can now try your REST services!

