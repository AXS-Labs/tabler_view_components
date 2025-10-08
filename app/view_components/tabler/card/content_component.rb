module Tabler
  # Card content component that wraps body content with optional title and nested sections.
  #
  # This component provides a flexible way to structure card content, supporting
  # an optional title, nested header, and nested body sections. It's typically
  # used within a {Tabler::CardComponent} via the `with_body` slot.
  #
  # @note This component is usually used via the `with_body` slot of {Tabler::CardComponent}
  #   and not rendered directly. It allows for complex card layouts with multiple sections.
  #
  # @example Basic content section
  #   <%= render(Tabler::Card::ContentComponent.new) do %>
  #     <p>Simple content</p>
  #   <% end %>
  #
  # @example Content with title
  #   <%= render(Tabler::Card::ContentComponent.new("Section Title")) do %>
  #     <p>Content goes here</p>
  #   <% end %>
  #
  # @example Content with nested header and body
  #   <%= render(Tabler::Card::ContentComponent.new) do |content| %>
  #     <% content.with_header("Nested Header") %>
  #     <% content.with_body do %>
  #       <p>Nested body content</p>
  #     <% end %>
  #   <% end %>
  #
  # @example Within a card component
  #   <%= render(Tabler::CardComponent.new) do |card| %>
  #     <% card.with_body("First Section") do %>
  #       <p>First section content</p>
  #     <% end %>
  #     <% card.with_body("Second Section") do %>
  #       <p>Second section content</p>
  #     <% end %>
  #   <% end %>
  class Card::ContentComponent < BaseComponent
    # @return [String, nil] the content section title
    attr_reader :title

    # @!method with_header(title = nil, subtitle: nil, &block)
    #   Adds a nested header within this content section.
    #   @param title [String, nil] the header title
    #   @param subtitle [String, nil] the header subtitle
    #   @yield [header] Yields a Tabler::Card::HeaderComponent instance
    #   @return [void]
    #   @example
    #     content.with_header("Nested Section", subtitle: "Details")
    renders_one :header, "Tabler::Card::HeaderComponent"

    # @!method with_body(&block)
    #   Adds a nested body within this content section.
    #   @yield Yields a Tabler::Card::BodyComponent instance
    #   @return [void]
    #   @example
    #     content.with_body do
    #       # Nested content here
    #     end
    renders_one :body, "Tabler::Card::BodyComponent"

    # Creates a new card content component.
    #
    # @param title [String, nil] optional title for the content section (default: nil)
    #
    # @example Create content without title
    #   Card::ContentComponent.new
    #
    # @example Create content with title
    #   Card::ContentComponent.new("Section Title")
    def initialize(title = nil)
      @title = title
    end

    # Renders the card content section.
    #
    # @return [String] the HTML output for the card content
    def call
      concat(header) if header?
      concat(body) if body?

      concat(
        content_tag(:div, class: "card-body") do
          concat(content_tag(:div, title, class: "card-title")) if title.present?
          concat(content) if content.present?
        end
      ) if content.present? || title.present?
    end
  end
end
