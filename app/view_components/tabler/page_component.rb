module Tabler
  # Page component that provides the main layout structure for Tabler pages.
  #
  # This component serves as the primary container for Tabler UI pages,
  # allowing you to compose a complete page layout with navigation bars
  # and other page-level elements.
  #
  # @example Basic page with navbar
  #   <%= render(Tabler::PageComponent.new) do |page| %>
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
  # @example Page with multiple navbars
  #   <%= render(Tabler::PageComponent.new) do |page| %>
  #     <% page.with_navbar do |navbar| %>
  #       <% navbar.with_item("Dashboard", "/dashboard", active: true) %>
  #     <% end %>
  #
  #     <% page.with_navbar do |navbar| %>
  #       <% navbar.with_item("Settings", "/settings") %>
  #     <% end %>
  #   <% end %>
  class PageComponent < BaseComponent
    # @!method with_navbar
    #   Adds a navbar to the page.
    #   @yield [navbar] Yields a Tabler::NavbarComponent instance
    #   @return [void]
    #
    # @!method with_navbars
    #   Adds multiple navbars to the page.
    #   @yield [navbar] Yields a Tabler::NavbarComponent instance for each navbar
    #   @return [void]
    renders_many :navbars, "Tabler::NavbarComponent"
  end
end
