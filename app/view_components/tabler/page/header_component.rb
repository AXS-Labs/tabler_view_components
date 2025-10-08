module Tabler
  # Page header component that displays the title, subtitle, and action buttons.
  #
  # This component renders the header section of a Tabler page, including
  # the page title (pretitle), subtitle, and optional primary/secondary action buttons.
  # It follows the Tabler design system layout for page headers.
  #
  # @note This component is typically used internally by {Tabler::PageComponent}
  #   and not rendered directly.
  #
  # @example Basic header with title and subtitle
  #   <%= render(Tabler::Page::HeaderComponent.new("Dashboard", subtitle: "Overview")) %>
  #
  # @example Header with action buttons
  #   <%= render(Tabler::Page::HeaderComponent.new("Projects", subtitle: "All projects")) do |header| %>
  #     <% header.with_primary_action("New Project", url: "/projects/new") %>
  #     <% header.with_secondary_action("Import", url: "/projects/import") %>
  #   <% end %>
  #
  # @example Header with only title
  #   <%= render(Tabler::Page::HeaderComponent.new("Settings")) %>
  class Page::HeaderComponent < BaseComponent
    # @!method with_primary_action(label, url: '#', **options)
    #   Adds a primary action button to the header.
    #   @param label [String] the button text
    #   @param url [String] the button URL
    #   @param options [Hash] additional button options (icon, size, etc.)
    #   @return [void]
    #   @example
    #     header.with_primary_action("Create", url: "/items/new", icon: "plus")
    renders_one :primary_action, "Tabler::Page::PrimaryButtonComponent"

    # @!method with_secondary_action(label, url: '#', **options)
    #   Adds a secondary action button to the header.
    #   @param label [String] the button text
    #   @param url [String] the button URL
    #   @param options [Hash] additional button options (icon, size, etc.)
    #   @return [void]
    #   @example
    #     header.with_secondary_action("Export", url: "/items/export", icon: "download")
    renders_one :secondary_action, "Tabler::Page::SecondaryButtonComponent"

    alias_method :with_primary_button, :with_primary_action

    # Creates a new page header component.
    #
    # @param title [String, nil] the page pretitle to display above the subtitle (default: nil)
    # @param subtitle [String, nil] the main page title to display (default: nil)
    #
    # @example Create a header with title
    #   Page::HeaderComponent.new("Dashboard")
    #
    # @example Create a header with title and subtitle
    #   Page::HeaderComponent.new("Users", subtitle: "Manage team members")
    def initialize(title = nil, subtitle: nil)
      @title = title
      @subtitle = subtitle
    end

    # Renders the page header with title, subtitle, and action buttons.
    #
    # @return [String] the HTML output for the page header
    def call
      content_tag(:div, class: "page-header d-print-none") do
        content_tag(:div, class: "container-xl") do
          content_tag(:div, class: "row g-2 align-items-center") do
            concat(
              content_tag(:div, class: "col") do
                concat(content_tag(:div, @title, class: "page-pretitle")) if @title.present?
                concat(content_tag(:h2, @subtitle, class: "page-title")) if @subtitle.present?
              end
            )

            concat(
              content_tag(:div, class: "col-auto ms-auto d-print-none") do
                content_tag(:div, class: "btn-list") do
                  concat(secondary_action) if secondary_action?
                  concat(primary_action) if primary_action?
                end
              end
            )
          end
        end
      end
    end
  end
end
