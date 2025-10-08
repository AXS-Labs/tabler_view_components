module Tabler
  # Button component for creating styled links and buttons following the Tabler design system.
  #
  # This component renders a link styled as a button with various color schemes,
  # sizes, and optional icons. It supports all Tabler button styles and variants.
  #
  # @example Basic button
  #   <%= render(Tabler::ButtonComponent.new("Click me", url: "/action")) %>
  #
  # @example Button with color variant
  #   <%= render(Tabler::ButtonComponent.new("Save", url: "/save", color: "success")) %>
  #   <%= render(Tabler::ButtonComponent.new("Delete", url: "/delete", color: "danger")) %>
  #
  # @example Button with icon
  #   <%= render(Tabler::ButtonComponent.new("Settings", url: "/settings", icon: "settings")) %>
  #
  # @example Icon-only button
  #   <%= render(Tabler::ButtonComponent.new("", url: "/search", icon: "search")) %>
  #
  # @example Button with size
  #   <%= render(Tabler::ButtonComponent.new("Small", url: "#", size: "sm")) %>
  #   <%= render(Tabler::ButtonComponent.new("Large", url: "#", size: "lg")) %>
  #
  # @example Button with custom HTML attributes
  #   <%= render(Tabler::ButtonComponent.new("Submit", url: "/submit", data: { turbo_method: :post })) %>
  #
  # @example Full-width button
  #   <%= render(Tabler::ButtonComponent.new("Full Width", url: "/action", full_width: true)) %>
  #
  # @example Ghost variant button
  #   <%= render(Tabler::ButtonComponent.new("Ghost", url: "#", color: "secondary", variant: :ghost)) %>
  class ButtonComponent < BaseComponent
    # Creates a new button component.
    #
    # @param label [String] the text to display on the button (can be empty for icon-only buttons)
    # @param url [String] the URL the button links to (default: '#')
    # @param color [String] the Tabler color variant (default: 'primary')
    #   Available colors: primary, secondary, success, warning, danger, info, light, dark, or empty string for neutral button
    # @param size [String, nil] the button size (default: nil for standard size)
    #   Available sizes: 'sm' (small), 'lg' (large)
    # @param icon [String, nil] the name of the Tabler icon to display (default: nil)
    # @param full_width [Boolean] whether the button should span the full width of its container (default: false)
    # @param variant [Symbol, nil] the button variant style (default: nil for solid button)
    #   Available variants: :ghost for ghost/transparent button style
    # @param options [Hash] additional HTML attributes to pass to the link element
    #
    # @example Create a primary button
    #   ButtonComponent.new("Click me", url: "/action")
    #
    # @example Create a danger button with icon
    #   ButtonComponent.new("Delete", url: "/delete", color: "danger", icon: "trash")
    #
    # @example Create an icon-only button
    #   ButtonComponent.new("", url: "/settings", icon: "settings")
    #
    # @example Create a small button with custom class
    #   ButtonComponent.new("Compact", url: "#", size: "sm", class: "my-custom-class")
    #
    # @example Create a full-width button
    #   ButtonComponent.new("Submit", url: "/submit", full_width: true)
    #
    # @example Create a ghost variant button
    #   ButtonComponent.new("Ghost Button", url: "#", color: "primary", variant: :ghost)
    #
    # @example Create a neutral button
    #   ButtonComponent.new("Cancel", url: "/back", color: "")
    def initialize(label, url: "#", color: "primary", size: nil, icon: nil, full_width: false, variant: nil, **options)
      @label = label
      @url = url
      @color = color
      @size = size
      @icon = icon
      @full_width = full_width
      @variant = variant
      @options = options
    end

    # Renders the button component.
    #
    # @return [String] the HTML output for the button
    def call
      @options[:class] = classes

      link_to @url, @options do
        concat(icon_tag) if @icon
        concat(@label)
      end
    end

    private

    # Builds the CSS classes for the button.
    #
    # Combines the base button class with color, size, icon-only, and full-width variants,
    # along with any custom classes provided via options. This method can be overridden
    # in subclasses to provide specialized button styling.
    #
    # @return [String] the compiled CSS class string
    def classes
      classes = ["btn"]
      classes << "#{variant_base_class}-#{@color}" if @color.present?
      classes << "btn-#{@size}" if @size
      classes << "btn-icon" if @icon && @label.blank?
      classes << "w-100" if @full_width

      [ @options[:class], *classes ].compact.join(" ")
    end

    # Renders the icon tag for the button.
    #
    # Adds appropriate spacing (margin-end) when the button has both an icon and a label.
    # For icon-only buttons, no margin is added.
    #
    # @return [String] the HTML output for the icon
    def icon_tag
      icon_class = @label.present? ? "me-2" : nil
      render(IconComponent.new(@icon, size: 20, class: icon_class))
    end

    # Determines the base CSS class prefix based on the variant.
    #
    # Returns 'btn-ghost' for ghost variant buttons, or 'btn' for standard solid buttons.
    # This is used when constructing color classes like 'btn-primary' or 'btn-ghost-secondary'.
    #
    # @return [String] the CSS class prefix for the button variant
    def variant_base_class
      @variant == :ghost ? "btn-ghost" : "btn"
    end
  end
end
