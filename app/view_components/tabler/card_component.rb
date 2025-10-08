module Tabler
  # Card component for creating structured content containers following the Tabler design system.
  #
  # This component renders a card container that can include a header, multiple body sections,
  # and a footer. Cards are commonly used to group related content and actions.
  #
  # @example Basic card with content
  #   <%= render(Tabler::CardComponent.new) do %>
  #     <p>Simple card content</p>
  #   <% end %>
  #
  # @example Card with header
  #   <%= render(Tabler::CardComponent.new) do |card| %>
  #     <% card.with_header("Card Title") %>
  #     <p>Card content goes here</p>
  #   <% end %>
  #
  # @example Card with header, body, and footer
  #   <%= render(Tabler::CardComponent.new) do |card| %>
  #     <% card.with_header("User Profile", subtitle: "Personal information") %>
  #     <% card.with_body do %>
  #       <p>Name: John Doe</p>
  #       <p>Email: john@example.com</p>
  #     <% end %>
  #     <% card.with_footer do %>
  #       <%= link_to "Edit", "/edit" %>
  #     <% end %>
  #   <% end %>
  #
  # @example Card with header actions
  #   <%= render(Tabler::CardComponent.new) do |card| %>
  #     <% card.with_header("Dashboard") do |header| %>
  #       <% header.with_action("Settings", url: "/settings", icon: "settings") %>
  #     <% end %>
  #     <p>Dashboard content</p>
  #   <% end %>
  #
  # @example Card with multiple body sections
  #   <%= render(Tabler::CardComponent.new) do |card| %>
  #     <% card.with_header("Report") %>
  #     <% card.with_body("Summary") do %>
  #       <p>Summary information</p>
  #     <% end %>
  #     <% card.with_body("Details") do %>
  #       <p>Detailed information</p>
  #     <% end %>
  #   <% end %>
  class CardComponent < BaseComponent
    # @!method with_header(title = nil, subtitle: nil, &block)
    #   Adds a header section to the card.
    #   @param title [String, nil] the card title
    #   @param subtitle [String, nil] the card subtitle
    #   @yield [header] Yields a Tabler::Card::HeaderComponent instance
    #   @return [void]
    #   @example
    #     card.with_header("Card Title")
    #   @example With subtitle
    #     card.with_header("Card Title", subtitle: "Subtitle text")
    #   @example With actions
    #     card.with_header("Card Title") do |header|
    #       header.with_action("Edit", url: "/edit")
    #     end
    renders_one :header, "Tabler::Card::HeaderComponent"

    # @!method with_body(title = nil, &block)
    #   Adds a body/content section to the card. Can be called multiple times.
    #   @param title [String, nil] optional title for the body section
    #   @yield Yields a Tabler::Card::ContentComponent instance
    #   @return [void]
    #   @example Simple body
    #     card.with_body do
    #       # Your content here
    #     end
    #   @example Body with title
    #     card.with_body("Section Title") do
    #       # Your content here
    #     end
    #
    # @!method with_bodies
    #   Adds multiple body sections to the card.
    #   @yield [body] Yields a Tabler::Card::ContentComponent instance for each body
    #   @return [void]
    renders_many :bodies, "Tabler::Card::ContentComponent"

    # @!method with_footer(&block)
    #   Adds a footer section to the card.
    #   @yield Yields a Tabler::Card::FooterComponent instance
    #   @return [void]
    #   @example
    #     card.with_footer do
    #       <%= link_to "View more", "/more" %>
    #     end
    renders_one :footer, "Tabler::Card::FooterComponent"

    # Renders the card component.
    #
    # @return [String] the HTML output for the card
    def call
      content_tag(:div, class: "card") do
        concat(header) if header?
        bodies.each do |body|
          concat(body)
        end
        concat(content) if content.present?
        concat(footer) if footer?
      end
    end
  end
end
