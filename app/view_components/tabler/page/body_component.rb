module Tabler
  # Page body component that wraps the main content area of a Tabler page.
  #
  # This component provides the standard Tabler page body container with proper
  # styling and responsive layout. It's typically used within a {Tabler::PageComponent}.
  #
  # @note This component is usually used via the `with_body` slot of {Tabler::PageComponent}
  #   and not instantiated directly.
  #
  # @example Basic usage within a page
  #   <%= render(Tabler::PageComponent.new("Dashboard")) do |page| %>
  #     <% page.with_body do %>
  #       <div class="row">
  #         <div class="col-md-6">Content here</div>
  #       </div>
  #     <% end %>
  #   <% end %>
  #
  # @example Direct rendering (rare)
  #   <%= render(Tabler::Page::BodyComponent.new) do %>
  #     <p>Main content</p>
  #   <% end %>
  class Page::BodyComponent < BaseComponent
    # Renders the page body with container wrapper.
    #
    # @return [String] the HTML output for the page body
    def call
      content_tag(:div, class: "page-body") do
        content_tag(:div, class: "container-xl") do
          content
        end
      end
    end
  end
end
