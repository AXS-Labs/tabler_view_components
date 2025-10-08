module Tabler
  module Page
    # Primary action button component for page headers.
    #
    # This component extends {Tabler::ButtonComponent} with a default primary color.
    # It's designed to be used as the main call-to-action button in page headers.
    #
    # @note This component is typically used via the `with_primary_action` slot
    #   of {Tabler::PageComponent} or {Tabler::Page::HeaderComponent}.
    #
    # @example Basic primary action
    #   <%= render(Tabler::Page::PrimaryButtonComponent.new("Create", url: "/items/new")) %>
    #
    # @example Primary action with icon
    #   <%= render(Tabler::Page::PrimaryButtonComponent.new("Add User", url: "/users/new", icon: "plus")) %>
    #
    # @example Within a page component
    #   <%= render(Tabler::PageComponent.new("Projects")) do |page| %>
    #     <% page.with_primary_action("New Project", url: "/projects/new", icon: "plus") %>
    #   <% end %>
    class PrimaryButtonComponent < Tabler::ButtonComponent
      # Creates a new primary action button.
      #
      # @param label [String] the button text
      # @param url [String] the URL the button links to (default: '#')
      # @param options [Hash] additional button options (icon, size, etc.)
      #   See {Tabler::ButtonComponent#initialize} for all available options
      #
      # @example Create a primary action button
      #   PrimaryButtonComponent.new("Save", url: "/save")
      #
      # @example With icon
      #   PrimaryButtonComponent.new("Create", url: "/create", icon: "plus")
      def initialize(label, url: "#", **options)
        super(label, url: url, color: "primary", **options)
      end
    end
  end
end
