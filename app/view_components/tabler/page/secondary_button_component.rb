module Tabler
  module Page
    # Secondary action button component for page headers.
    #
    # This component extends {Tabler::ButtonComponent} with a neutral/ghost color style.
    # It's designed to be used as a secondary action button in page headers,
    # appearing less prominent than the primary action.
    #
    # @note This component is typically used via the `with_secondary_action` slot
    #   of {Tabler::PageComponent} or {Tabler::Page::HeaderComponent}.
    #
    # @example Basic secondary action
    #   <%= render(Tabler::Page::SecondaryButtonComponent.new("Export", url: "/items/export")) %>
    #
    # @example Secondary action with icon
    #   <%= render(Tabler::Page::SecondaryButtonComponent.new("Settings", url: "/settings", icon: "settings")) %>
    #
    # @example Within a page component
    #   <%= render(Tabler::PageComponent.new("Projects")) do |page| %>
    #     <% page.with_primary_action("New Project", url: "/projects/new") %>
    #     <% page.with_secondary_action("Import", url: "/projects/import", icon: "upload") %>
    #   <% end %>
    class SecondaryButtonComponent < Tabler::ButtonComponent
      # Creates a new secondary action button.
      #
      # @param label [String] the button text
      # @param url [String] the URL the button links to (default: '#')
      # @param options [Hash] additional button options (icon, size, etc.)
      #   See {Tabler::ButtonComponent#initialize} for all available options
      #
      # @example Create a secondary action button
      #   SecondaryButtonComponent.new("Cancel", url: "/back")
      #
      # @example With icon
      #   SecondaryButtonComponent.new("Export", url: "/export", icon: "download")
      def initialize(label, url: "#", **options)
        super(label, url: url, color: "", **options)
      end
    end
  end
end
