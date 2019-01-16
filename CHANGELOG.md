# Change Log

## v2.0.0 - 19-01-16

### Added

* Change log File
* ApplicationRecord class (`app/models/application_record.rb`)
* Docker build/run scripts - see `README.md` for details (`package.json`)
* Debug support for VSCode - see `.vscode/launch.json` for details (`.vscode/launch.json, Gemfile`)
* Assets initializer (`config/initializers/assets.rb`)

### Changed

* Migrated from Rails 4.1.0 to 5.2.2
* All models now inherit from `ApplicationRecord`
* Updated dependencies 

### Fixed

* NoMethodError thrown at `ajax#index`, `ajax_history#index`, and `articles#index` caused by a bug in `Grapple::Helpers::TableHelper#grapple_container`
* Table in `app/views/articles/_table.html.rb` could not find english translations for title, contents, and created_at
* Sub-classing directly from `ActiveRecord::Migration` is deprecated, switched to `ActiveRecord::Migration[4.2]`
