module Tabler
  # Navigation item component for use within a Navbar.
  #
  # This component represents a single navigation link within a navbar.
  # It supports active state styling and can be used to create navigation
  # menus following the Tabler design system.
  #
  # @note This component is typically used within a {Tabler::NavbarComponent}
  #   and not rendered directly.
  #
  # @example Basic navigation item
  #   <%= render(Tabler::NavbarItemComponent.new("Home", "/")) %>
  #
  # @example Active navigation item
  #   <%= render(Tabler::NavbarItemComponent.new("Dashboard", "/dashboard", active: true)) %>
  #
  # @example Navigation item with default href
  #   <%= render(Tabler::NavbarItemComponent.new("Placeholder")) %>
  #
  # @example Within a navbar
  #   <%= render(Tabler::NavbarComponent.new) do |navbar| %>
  #     <% navbar.with_item("Home", "/", active: true) %>
  #     <% navbar.with_item("About", "/about") %>
  #   <% end %>
  class NavbarItemComponent < ViewComponent::Base
    # @return [String] the text label displayed for the navigation item
    attr_reader :title

    # @return [String] the URL the navigation item links to
    attr_reader :href

    # @return [Boolean] whether this item represents the current page
    attr_reader :active

    alias_method :to, :href
    alias_method :active?, :active

    renders_one :icon, "Tabler::IconComponent"

    # Creates a new navigation item.
    #
    # @param title [String] the text label for the navigation item
    # @param href [String] the URL the item links to (default: '#')
    # @param active [Boolean] whether this item represents the current page (default: false)
    #
    # @example Create a simple navigation item
    #   NavbarItemComponent.new("Home", "/")
    #
    # @example Create an active navigation item
    #   NavbarItemComponent.new("Dashboard", "/dashboard", active: true)
    #
    # @example Create an item with placeholder link
    #   NavbarItemComponent.new("Coming Soon")
    def initialize(title, href = "#", active: false, icon: nil)
      @title = title
      @href = href
      @active = active
      @icon_name = icon
    end

    def icon
      icon_name.present? ? render(Tabler::IconComponent.new(icon_name)) : super
    end

    private

    attr_reader :icon_name
  end
end
