module Tabler
  # Card table component for embedding tables within cards.
  #
  # This component provides a responsive wrapper for tables inside cards,
  # automatically applying the 'table-responsive' class for horizontal scrolling
  # on smaller screens. It follows the Tabler design system styling for card tables.
  #
  # @note This component is usually used via the `with_table` slot of {Tabler::CardComponent}
  #   and not rendered directly.
  #
  # @example Basic table in a card
  #   <%= render(Tabler::CardComponent.new) do |card| %>
  #     <% card.with_table do %>
  #       <table class="table">
  #         <thead>
  #           <tr><th>Name</th><th>Email</th></tr>
  #         </thead>
  #         <tbody>
  #           <tr><td>John</td><td>john@example.com</td></tr>
  #         </tbody>
  #       </table>
  #     <% end %>
  #   <% end %>
  #
  # @example Table with custom wrapper classes
  #   <%= render(Tabler::CardComponent.new) do |card| %>
  #     <% card.with_table(class: "table-responsive-sm") do %>
  #       <table class="table table-striped">
  #         <!-- table content -->
  #       </table>
  #     <% end %>
  #   <% end %>
  #
  # @example Card with header and table
  #   <%= render(Tabler::CardComponent.new) do |card| %>
  #     <% card.with_header("User List") %>
  #     <% card.with_table do %>
  #       <table class="table card-table">
  #         <!-- table content -->
  #       </table>
  #     <% end %>
  #   <% end %>
  class Card::TableComponent < BaseComponent
    # Creates a new card table component.
    #
    # @param options [Hash] additional HTML attributes, including custom CSS classes
    #
    # @option options [String, Array<String>] :class custom CSS classes for the wrapper div
    #   (default: 'table-responsive' if no class provided)
    #
    # @example Create a table wrapper with default responsive class
    #   Card::TableComponent.new
    #
    # @example Create a table wrapper with custom class
    #   Card::TableComponent.new(class: "table-responsive-md")
    #
    # @example Create a table wrapper with multiple classes
    #   Card::TableComponent.new(class: ["table-responsive", "border-top"])
    def initialize(**options)
      @options = options
      @class_names = Array(options.delete(:class)).join(" ").presence || "table-responsive"
    end

    # Renders the table wrapper for the card.
    #
    # @return [String] the HTML output for the table wrapper
    def call
      content_tag(:div, class: "#{@class_names}") do
        content
      end
    end
  end
end
