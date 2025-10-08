module Tabler
  # Page component that provides the main layout structure for Tabler pages.
  #
  # This component serves as the primary container for Tabler UI pages,
  # allowing you to compose a complete page layout with navigation bars,
  # page titles, subtitles, and action buttons.
  #
  # @example Basic page with title
  #   <%= render(Tabler::PageComponent.new("Dashboard")) do %>
  #     <div class="page-body">
  #       <!-- Page content goes here -->
  #     </div>
  #   <% end %>
  #
  # @example Page with title and subtitle
  #   <%= render(Tabler::PageComponent.new("Users", subtitle: "Manage your team")) do %>
  #     <!-- Page content -->
  #   <% end %>
  #
  # @example Page with navbar
  #   <%= render(Tabler::PageComponent.new("Dashboard")) do |page| %>
  #     <% page.with_navbar do |navbar| %>
  #       <% navbar.with_item("Home", "/") %>
  #       <% navbar.with_item("About", "/about") %>
  #     <% end %>
  #
  #     <div class="page-body">
  #       <!-- Page content goes here -->
  #     </div>
  #   <% end %>
  #
  # @example Page with primary and secondary actions
  #   <%= render(Tabler::PageComponent.new("Projects")) do |page| %>
  #     <% page.with_primary_action("Create Project", url: "/projects/new") %>
  #     <% page.with_secondary_action("Import", url: "/projects/import") %>
  #
  #     <!-- Page content -->
  #   <% end %>
  #
  # @example Complete page with all features
  #   <%= render(Tabler::PageComponent.new("Dashboard", subtitle: "Welcome back")) do |page| %>
  #     <% page.with_navbar do |navbar| %>
  #       <% navbar.with_item("Overview", "/dashboard", active: true) %>
  #       <% navbar.with_item("Analytics", "/analytics") %>
  #     <% end %>
  #
  #     <% page.with_primary_action("New Item", url: "/items/new", icon: "plus") %>
  #     <% page.with_secondary_action("Settings", url: "/settings", icon: "settings") %>
  #
  #     <div class="page-body">
  #       <!-- Page content -->
  #     </div>
  #   <% end %>
  class PageComponent < BaseComponent
    # @!method with_navbar(&block)
    #   Adds a navbar to the page.
    #   @yield [navbar] Yields a Tabler::NavbarComponent instance
    #   @return [void]
    #   @example
    #     page.with_navbar do |navbar|
    #       navbar.with_item("Home", "/")
    #       navbar.with_item("About", "/about")
    #     end
    #
    # @!method with_navbars(&block)
    #   Adds multiple navbars to the page.
    #   @yield [navbar] Yields a Tabler::NavbarComponent instance for each navbar
    #   @return [void]
    renders_many :navbars, "Tabler::NavbarComponent"

    # @!method with_primary_action(label, url: '#', **options)
    #   Adds a primary action button to the page header.
    #   @param label [String] the button text
    #   @param url [String] the button URL
    #   @param options [Hash] additional button options (icon, size, etc.)
    #   @return [void]
    #   @example
    #     page.with_primary_action("Create", url: "/items/new", icon: "plus")
    renders_one :primary_action, "Tabler::Page::PrimaryButtonComponent"

    # @!method with_secondary_action(label, url: '#', **options)
    #   Adds a secondary action button to the page header.
    #   @param label [String] the button text
    #   @param url [String] the button URL
    #   @param options [Hash] additional button options (icon, size, etc.)
    #   @return [void]
    #   @example
    #     page.with_secondary_action("Settings", url: "/settings", icon: "settings")
    renders_one :secondary_action, "Tabler::Page::SecondaryButtonComponent"

    # @!method with_body(&block)
    #   Adds the main body/content area to the page.
    #   @yield Yields a Tabler::Page::BodyComponent instance to wrap the page content
    #   @return [void]
    #   @example
    #     page.with_body do
    #       # Your page content here
    #     end
    renders_one :body, "Tabler::Page::BodyComponent"

    # Creates a new page component.
    #
    # @param title [String, nil] the page title to display in the page header (default: nil)
    # @param subtitle [String, nil] the page subtitle to display below the title (default: nil)
    #
    # @example Create a page with title
    #   PageComponent.new("Dashboard")
    #
    # @example Create a page with title and subtitle
    #   PageComponent.new("Users", subtitle: "Manage your team members")
    #
    # @example Create a page without title
    #   PageComponent.new
    #
    def initialize(title = nil, subtitle: nil)
      @title = title
      @subtitle = subtitle
    end

    private

    def page_header?
      @title.present? || primary_action? || secondary_action?
    end
  end
end
