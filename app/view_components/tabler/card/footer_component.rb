module Tabler
  # Card footer component that wraps content in a card footer container.
  #
  # This component provides a footer section for cards, typically used for
  # actions, metadata, or additional information at the bottom of the card.
  # It follows the Tabler design system styling.
  #
  # @note This component is usually used via the `with_footer` slot of {Tabler::CardComponent}
  #   and not rendered directly.
  #
  # @example Basic footer
  #   <%= render(Tabler::Card::FooterComponent.new) do %>
  #     <p>Footer content</p>
  #   <% end %>
  #
  # @example Footer with actions
  #   <%= render(Tabler::Card::FooterComponent.new) do %>
  #     <%= link_to "View more", "/more", class: "btn" %>
  #     <%= link_to "Cancel", "/back", class: "btn" %>
  #   <% end %>
  #
  # @example Within a card component
  #   <%= render(Tabler::CardComponent.new) do |card| %>
  #     <% card.with_header("Report") %>
  #     <% card.with_body do %>
  #       <p>Report data</p>
  #     <% end %>
  #     <% card.with_footer do %>
  #       <%= link_to "Download PDF", "/download", class: "btn btn-primary" %>
  #     <% end %>
  #   <% end %>
  #
  # @example Footer with metadata
  #   <%= render(Tabler::CardComponent.new) do |card| %>
  #     <% card.with_body do %>
  #       <p>Article content</p>
  #     <% end %>
  #     <% card.with_footer do %>
  #       <small class="text-muted">Last updated: <%= Time.now.strftime("%B %d, %Y") %></small>
  #     <% end %>
  #   <% end %>
  class Card::FooterComponent < BaseComponent
    # Creates a new card footer component.
    #
    # @param options [Hash] additional HTML attributes, including custom CSS classes
    #
    # @option options [String, Array<String>] :class custom CSS classes to add to the card footer
    #
    # @example Create a basic footer
    #   Card::FooterComponent.new
    #
    # @example Create a footer with custom classes
    #   Card::FooterComponent.new(class: "text-end bg-light")
    #
    # @example Create a footer with multiple classes
    #   Card::FooterComponent.new(class: ["d-flex", "justify-content-between"])
    def initialize(**options)
      @options = options
      @class_names = Array(options.delete(:class)).join(" ")
    end

    # Renders the card footer wrapper.
    #
    # @return [String] the HTML output for the card footer
    def call
      content_tag(:div, class: "card-footer #{@class_names}") do
        content
      end
    end
  end
end
