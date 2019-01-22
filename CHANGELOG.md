# Change Log

## v2.1.1 - 2019-01-18 :rocket:

### Added

* Database initialization bash script (`bin/init`)
* Database initialization instructions (`README.md`)
* Dropdown links in navbar for easier navigation
* [Ransack](https://github.com/activerecord-hackery/Ransack) search gem demo (views, controller, etc.)
* `dev` npm script (`package.json`)

### Changed

* `grapple` gem comes from [Don's Fork](https://github.com/DonIsaac/grapple) for development purposes (*NOTE: this should be changed if someone else takes over maintenance*)
* Improved nav bar
* Modified `README.md` to reflect changes

### Fixed

* Accidental deletion of `model.create` in the `load_fixtures` rake task (`lib/tasks/load_fixtures.rake`)

----

## v2.0.0 - 2019-01-16 :rocket:

### Added

* Change log File
* ApplicationRecord class (`app/models/application_record.rb`)
* Docker build/run scripts - see `README.md` for details (`package.json`)
* Debug support for VSCode - see `.vscode/launch.json` for details (`.vscode/launch.json, Gemfile`)
* Assets initializer (`config/initializers/assets.rb`)
* Dockerfile (`Dockerfile`)

### Changed

* Migrated from Rails 4.1.0 to 5.2.2
* All models now inherit from `ApplicationRecord`
* Updated dependencies

### Fixed

* NoMethodError thrown at `ajax#index`, `ajax_history#index`, and `articles#index` caused by a bug in `Grapple::Helpers::TableHelper#grapple_container`
* Table in `app/views/articles/_table.html.rb` could not find english translations for title, contents, and created_at
* Sub-classing directly from `ActiveRecord::Migration` is deprecated, switched to `ActiveRecord::Migration[4.2]`
