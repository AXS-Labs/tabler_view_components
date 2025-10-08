module Tabler
  # Card body component that wraps content in a standard card body container.
  #
  # This component provides a simple wrapper for card body content with proper
  # Tabler styling. It's typically used within {Tabler::Card::ContentComponent}.
  #
  # @note This component is usually used via nested slots within {Tabler::Card::ContentComponent}
  #   and not rendered directly.
  #
  # @example Basic body
  #   <%= render(Tabler::Card::BodyComponent.new) do %>
  #     <p>Body content</p>
  #   <% end %>
  #
  # @example Within a content component
  #   <%= render(Tabler::Card::ContentComponent.new) do |content| %>
  #     <% content.with_body do %>
  #       <p>Nested body content</p>
  #     <% end %>
  #   <% end %>
  #
  # @example Complex nested structure
  #   <%= render(Tabler::CardComponent.new) do |card| %>
  #     <% card.with_body do |content| %>
  #       <% content.with_body do %>
  #         <p>Deeply nested content</p>
  #       <% end %>
  #     <% end %>
  #   <% end %>
  class Card::BodyComponent < BaseComponent
    def initialize(title = nil, **options)
      @title = title
      @options = options
      @class_names = Array(options.delete(:class)).join(" ")
    end

    # Renders the card body wrapper.
    #
    # @return [String] the HTML output for the card body
    def call
      content_tag(:div, class: "card-body #{@class_names}") do
        concat(content_tag(:div, @title, class: "card-title")) if @title.present?
        concat(content) if content.present?
      end
    end
  end
end
