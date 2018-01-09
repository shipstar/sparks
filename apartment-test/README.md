# apartment-test

This is a simple Rails 4.0.4 project to show off the issues I'm having with apartment. See the Gemfile for the list of dependencies.

The schema consists of a single table (`articles`) with two columns (`title`, `permalink`). `db/schema.rb` and `db/site_schema.rb` contain identical configuration, and the latter is passed to Apartment as its `database_schema_file`.

Feel free to ping me with any questions on the [original issue](https://github.com/influitive/apartment/issues/127).
