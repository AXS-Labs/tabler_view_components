module Tabler
  # Page content wrapper component that combines header and body sections.
  #
  # This component serves as a container for both the page header and body,
  # providing a structured layout for Tabler pages. It's is also used by the
  # Tabler::PageComponent. It is typically that in you layout you use the page
  # component and would like to change the header or body only. In that case you
  # can use this component directly as content for the page component but still has
  # the same convenience methods to set header and body.
  #
  # @example Basic usage
  #   <%= render(Tabler::Page::ContentComponent.new) do |content| %>
  #     <% content.with_header("Dashboard", subtitle: "Overview") %>
  #     <% content.with_body do %>
  #       <p>Page content here</p>
  #     <% end %>
  #   <% end %>
  #
  # @example Usage within a page component
  #   <%= render(Tabler::PageComponent.new) do |page| %> # this lives within the layout
  #     <%= render Tabler::Page::ContentComponent.new do |content| %>
  #       <% content.with_header("Dashboard", subtitle: "Overview") %>
  #       <% content.with_body do %>
  #         <p>Page content here</p>
  #       <% end %>
  #     <% end %>
  #   <% end %>
  #
  # @example With header actions
  #   <%= render(Tabler::Page::ContentComponent.new) do |content| %>
  #     <% content.with_header("Projects", subtitle: "All projects") do |header| %>
  #       <% header.with_primary_action("New", url: "/projects/new") %>
  #     <% end %>
  #     <% content.with_body do %>
  #       <!-- Projects list -->
  #     <% end %>
  #   <% end %>
  class Page::ContentComponent < BaseComponent
    # @!method with_header(title = nil, subtitle: nil, &block)
    #   Adds a header section to the page content.
    #   @param title [String, nil] the page pretitle
    #   @param subtitle [String, nil] the main page title
    #   @yield [header] Yields a Tabler::Page::HeaderComponent instance
    #   @return [void]
    #   @example
    #     content.with_header("Dashboard", subtitle: "Overview")
    renders_one :header, "Tabler::Page::HeaderComponent"

    # @!method with_body(&block)
    #   Adds a body section to the page content.
    #   @yield Yields a Tabler::Page::BodyComponent instance to wrap the page content
    #   @return [void]
    #   @example
    #     content.with_body do
    #       # Your page content here
    #     end
    renders_one :body, "Tabler::Page::BodyComponent"
  end
end
