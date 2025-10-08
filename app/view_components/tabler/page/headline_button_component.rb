module Tabler
  module Page
    # Headline button component for page headers that provides navigation back functionality.
    #
    # This component extends {Tabler::ButtonComponent} with a ghost-secondary style
    # and a default back arrow icon. It's designed to be displayed in the headline area
    # of page headers, typically for navigation back to a parent page or list view.
    #
    # @note This component is typically used via the `with_headline_action` slot
    #   of {Tabler::Page::HeaderComponent} and not rendered directly.
    #
    # @example Basic headline button
    #   <%= render(Tabler::Page::HeadlineButtonComponent.new("Back", url: "/projects")) %>
    #
    # @example Headline button with custom icon
    #   <%= render(Tabler::Page::HeadlineButtonComponent.new("Home", url: "/", icon: "home")) %>
    #
    # @example Within a page header
    #   <%= render(Tabler::Page::HeaderComponent.new("Project Details", subtitle: "View project")) do |header| %>
    #     <% header.with_headline_action("Back to Projects", url: "/projects") %>
    #   <% end %>
    #
    # @example Within a page component
    #   <%= render(Tabler::PageComponent.new("User Profile", subtitle: "John Doe")) do |page| %>
    #     <% page.with_headline_action("Back to Users", url: "/users") %>
    #     <!-- Page content -->
    #   <% end %>
    class HeadlineButtonComponent < Tabler::ButtonComponent
      # Creates a new headline button.
      #
      # @param label [String] the button text
      # @param url [String] the URL the button links to (default: '#')
      # @param icon [String] the Tabler icon name (default: 'arrow-left')
      # @param options [Hash] additional button options
      #   See {Tabler::ButtonComponent#initialize} for all available options
      #
      # @example Create a basic back button
      #   HeadlineButtonComponent.new("Back", url: "/list")
      #
      # @example Create a button with custom icon
      #   HeadlineButtonComponent.new("Dashboard", url: "/", icon: "home")
      #
      # @example Create a button with additional options
      #   HeadlineButtonComponent.new("Return", url: "/back", data: { turbo: false })
      def initialize(label, url: "#", icon: "arrow-left", **options)
        super(label, url: url, color: "", icon: icon, **options)
      end

      # Returns the CSS classes for the headline button.
      #
      # Overrides the parent `classes` method to provide a fixed set of classes
      # specific to headline buttons, ensuring consistent styling.
      #
      # @return [String] the CSS class string
      def classes
        "btn btn-ghost-secondary btn-sm ms-0"
      end
    end
  end
end
