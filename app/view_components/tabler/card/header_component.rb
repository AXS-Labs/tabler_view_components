module Tabler
  # Card header component that displays the title, subtitle, and action buttons.
  #
  # This component renders the header section of a card, including optional
  # title, subtitle, and action buttons. It's typically used within a {Tabler::CardComponent}.
  #
  # @note This component is usually used via the `with_header` slot of {Tabler::CardComponent}
  #   and not rendered directly.
  #
  # @example Basic header with title
  #   <%= render(Tabler::Card::HeaderComponent.new("Card Title")) %>
  #
  # @example Header with title and subtitle
  #   <%= render(Tabler::Card::HeaderComponent.new("User Profile", subtitle: "Personal details")) %>
  #
  # @example Header with actions
  #   <%= render(Tabler::Card::HeaderComponent.new("Dashboard")) do |header| %>
  #     <% header.with_action("Edit", url: "/edit", icon: "edit") %>
  #     <% header.with_action("Delete", url: "/delete", icon: "trash", color: "danger") %>
  #   <% end %>
  #
  # @example Within a card component
  #   <%= render(Tabler::CardComponent.new) do |card| %>
  #     <% card.with_header("Projects", subtitle: "All active projects") do |header| %>
  #       <% header.with_action("New", url: "/projects/new", icon: "plus") %>
  #     <% end %>
  #   <% end %>
  class Card::HeaderComponent < BaseComponent
    # @return [String, nil] the card title
    attr_reader :title

    # @return [String, nil] the card subtitle
    attr_reader :subtitle

    # @!method with_action(label, url: '#', **options)
    #   Adds an action button to the card header.
    #   @param label [String] the button text
    #   @param url [String] the button URL
    #   @param options [Hash] additional button options (icon, color, size, etc.)
    #   @return [void]
    #   @example
    #     header.with_action("Edit", url: "/edit", icon: "edit")
    #   @example Multiple actions
    #     header.with_action("Save", url: "/save", color: "primary")
    #     header.with_action("Cancel", url: "/cancel")
    #
    # @!method with_actions
    #   Adds multiple action buttons to the card header.
    #   @yield [action] Yields a Tabler::ButtonComponent instance for each action
    #   @return [void]
    renders_many :actions, "Tabler::Card::ActionButtonComponent"

    # Creates a new card header component.
    #
    # @param title [String, nil] the card title (default: nil)
    # @param subtitle [String, nil] the card subtitle (default: nil)
    #
    # @example Create a header with title
    #   Card::HeaderComponent.new("Settings")
    #
    # @example Create a header with title and subtitle
    #   Card::HeaderComponent.new("User Profile", subtitle: "Manage your account")
    def initialize(title = nil, subtitle: nil)
      @title = title
      @subtitle = subtitle
    end

    # Renders the card header.
    #
    # @return [String] the HTML output for the card header
    def call
      content_tag(:div, class: "card-header") do
        concat(content_tag(:div, title, class: "card-title")) if title.present?
        concat(content_tag(:div, subtitle, class: "card-subtitle")) if subtitle.present?

        concat(content_tag(:div, class: "card-actions") do
          actions.each do |action|
            concat(action)
          end
        end) if actions.any?
      end
    end
  end
end
