require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Demo
  class Application < Rails::Application
    config.load_defaults Rails::VERSION::STRING.to_f

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("../../app/view_components")

    # Auto-reload ViewComponents from gem during development
    gem_components_path = Rails.root.join("../app/view_components")
    config.autoload_paths << gem_components_path
    config.eager_load_paths << gem_components_path

    previews_path = Rails.root.join("../previews")
    config.autoload_paths << previews_path
    config.eager_load_paths << previews_path

    # Initialize configuration defaults for originally generated Rails version.
    # config.view_component.previews.default_layout = "component_preview"
    # config.view_component.previews.enabled = true
    # config.view_component.previews.controller = "PreviewController"
    # config.view_component.previews.paths << Rails.root.join("..", "previews")

    config.lookbook.page_paths = [Rails.root.join("..", "previews", "pages")]
    config.lookbook.component_paths = [Rails.root.join("..", "app", "components")]
    config.lookbook.preview_paths = [Rails.root.join("..", "previews")]
    config.lookbook.preview_paths = [Rails.root.join("..", "previews")]
    config.lookbook.preview_layout = "component_preview"
  end
end
