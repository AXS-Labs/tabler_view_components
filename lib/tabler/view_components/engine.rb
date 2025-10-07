module Tabler::ViewComponents
  class Engine < ::Rails::Engine
    # config.before_configuration do |app|
    #   # Add ViewComponent paths from the gem
    #   app.config.autoload_paths << root.join("app/view_components")
    #   app.config.eager_load_paths << root.join("app/view_components")
    # end
    #

    config.eager_load_paths = %W[
      #{root}/app/components
    ]


    initializer "tabler_view_components.configure_view_component_paths" do |app|
      # Ensure ViewComponent can find our components
      app.config.view_component.view_component_path = app.root.join("app/view_components")
    end

    private

    def root
      @root ||= Pathname.new(File.expand_path("../..", __dir__))
    end
  end
end
