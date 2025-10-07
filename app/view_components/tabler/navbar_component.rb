module Tabler
  # Navbar component for creating navigation bars in Tabler UI.
  #
  # This component renders a horizontal navigation bar that can contain
  # multiple navigation items. It follows the Tabler design system
  # guidelines for navigation elements.
  #
  # @example Basic navbar with items
  #   <%= render(Tabler::NavbarComponent.new) do |navbar| %>
  #     <% navbar.with_item("Home", "/", active: true) %>
  #     <% navbar.with_item("Products", "/products") %>
  #     <% navbar.with_item("About", "/about") %>
  #   <% end %>
  #
  # @example Navbar within a page component
  #   <%= render(Tabler::PageComponent.new) do |page| %>
  #     <% page.with_navbar do |navbar| %>
  #       <% navbar.with_item("Dashboard", "/dashboard", active: true) %>
  #       <% navbar.with_item("Reports", "/reports") %>
  #       <% navbar.with_item("Settings", "/settings") %>
  #     <% end %>
  #   <% end %>
  #
  # @example Navbar with custom content
  #   <%= render(Tabler::NavbarComponent.new) do |navbar| %>
  #     <% navbar.with_item("Home", "/") %>
  #     <% navbar.with_item("Docs", "/docs") %>
  #     <!-- Additional custom content -->
  #     <div class="navbar-item">Custom Element</div>
  #   <% end %>
  class NavbarComponent < BaseComponent
    # @!method with_item(title, href = '#', active: false)
    #   Adds a navigation item to the navbar.
    #   @param title [String] the text label for the navigation item
    #   @param href [String] the URL the item links to (default: '#')
    #   @param active [Boolean] whether this item represents the current page (default: false)
    #   @return [void]
    #
    # @!method with_items
    #   Adds multiple navigation items to the navbar.
    #   @yield [item] Yields a Tabler::NavbarItemComponent instance for each item
    #   @return [void]
    renders_many :items, "Tabler::NavbarItemComponent"
  end
end
