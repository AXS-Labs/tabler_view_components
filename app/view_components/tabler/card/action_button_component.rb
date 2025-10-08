module Tabler
  module Card
    # Action button component for card headers.
    #
    # This component extends {Tabler::ButtonComponent} with a specialized action button style
    # designed for use in card headers. It provides a compact, icon-focused button appearance
    # that fits well in the card header's action area.
    #
    # @note This component is typically used via the `with_action` slot
    #   of {Tabler::Card::HeaderComponent} and not rendered directly.
    #
    # @example Basic action button
    #   <%= render(Tabler::Card::ActionButtonComponent.new("Edit", url: "/edit")) %>
    #
    # @example Action button with icon
    #   <%= render(Tabler::Card::ActionButtonComponent.new("Delete", url: "/delete", icon: "trash")) %>
    #
    # @example Icon-only action button
    #   <%= render(Tabler::Card::ActionButtonComponent.new("", url: "/settings", icon: "settings")) %>
    #
    # @example Within a card header
    #   <%= render(Tabler::Card::HeaderComponent.new("User Profile")) do |header| %>
    #     <% header.with_action("Edit", url: "/edit", icon: "edit") %>
    #     <% header.with_action("Delete", url: "/delete", icon: "trash") %>
    #   <% end %>
    #
    # @example Within a card component
    #   <%= render(Tabler::CardComponent.new) do |card| %>
    #     <% card.with_header("Settings") do |header| %>
    #       <% header.with_action("Save", url: "/save", icon: "check") %>
    #     <% end %>
    #   <% end %>
    class ActionButtonComponent < Tabler::ButtonComponent
      # Creates a new card action button.
      #
      # @param label [String] the button text (can be empty for icon-only buttons)
      # @param url [String] the URL the button links to (default: '#')
      # @param icon [String] the Tabler icon name (default: 'arrow-left')
      # @param options [Hash] additional button options
      #   See {Tabler::ButtonComponent#initialize} for all available options
      #
      # @example Create a basic action button
      #   ActionButtonComponent.new("Edit", url: "/edit")
      #
      # @example Create an action button with icon
      #   ActionButtonComponent.new("Delete", url: "/delete", icon: "trash")
      #
      # @example Create an icon-only action button
      #   ActionButtonComponent.new("", url: "/settings", icon: "settings")
      def initialize(label, url: "#", icon: "arrow-left", **options)
        super(label, url: url, color: "", icon: icon, **options)
      end

      # Returns the CSS classes for the card action button.
      #
      # Overrides the parent `classes` method to provide a fixed set of classes
      # specific to card action buttons, ensuring consistent styling.
      #
      # @return [String] the CSS class string
      def classes
        "btn btn-action"
      end
    end
  end
end
