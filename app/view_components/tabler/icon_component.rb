# frozen_string_literal: true

module Tabler
  # IconComponent renders Tabler SVG icons from the local icon library.
  # Supports both outline and filled variants with customizable attributes.
  #
  # @example Basic icon
  #   <%= render Tabler::IconComponent.new(name: "home") %>
  #
  # @example Filled icon with custom size
  #   <%= render Tabler::IconComponent.new(name: "star", variant: :filled, size: 32) %>
  #
  # @example Icon with custom CSS classes and stroke width
  #   <%= render Tabler::IconComponent.new(name: "settings", class: "text-primary", stroke_width: 1.5) %>
  #
  # @example Icon with custom color
  #   <%= render Tabler::IconComponent.new(name: "heart", class: "text-danger") %>
  #
  class IconComponent < ViewComponent::Base
    # Initialize a new IconComponent
    #
    # @param name [String, Symbol] Icon name (e.g., "home", "star", "settings")
    # @param variant [Symbol] Icon variant - :outline (default) or :filled
    # @param size [Integer] Size in pixels (width and height, default: 24)
    # @param stroke_width [Float, Integer] Stroke width for outline icons (default: 2)
    # @param class [String] Additional CSS classes
    # @param color [String] Custom color (uses currentColor by default)
    # @param html_attributes [Hash] Additional HTML attributes for the SVG tag
    def initialize(name, variant: :outline, size: 24, stroke_width: 2, **html_attributes)
      @name = name.to_s.downcase
      @variant = variant.to_sym
      @size = size
      @stroke_width = stroke_width
      @html_attributes = html_attributes
      @custom_class = html_attributes.delete(:class)
    end

    def call
      return missing_icon_placeholder unless icon_exists?

      svg_content = read_icon_file
      modify_svg_attributes(svg_content)
    end

    private

    attr_reader :name, :variant, :size, :stroke_width, :html_attributes, :custom_class

    def icon_exists?
      File.exist?(icon_path)
    end

    def icon_path
      Tabler::ViewComponents.root.join("lib/tabler/view_components/icons", variant.to_s, "#{name}.svg")
    end

    def read_icon_file
      File.read(icon_path)
    end

    def modify_svg_attributes(svg_content)
      # Parse SVG with Nokogiri for reliable attribute manipulation
      doc = Nokogiri::XML(svg_content)
      svg = doc.at_xpath("//xmlns:svg", "xmlns" => "http://www.w3.org/2000/svg")

      return svg_content.html_safe unless svg

      # Set size attributes and inline styles to override Tabler CSS
      svg["width"] = size.to_s
      svg["height"] = size.to_s

      # Build inline styles to override Tabler CSS
      styles = []
      styles << "width: #{size}px"
      styles << "height: #{size}px"

      # Set stroke-width for outline icons (both attribute and inline style)
      if variant == :outline
        svg["stroke-width"] = stroke_width.to_s
        styles << "stroke-width: #{stroke_width}"
      end

      # Apply inline styles
      existing_style = svg["style"]
      style_string = styles.join("; ")
      svg["style"] = existing_style.present? ? "#{existing_style}; #{style_string}" : style_string

      # Add CSS classes
      css_classes = build_css_classes
      if css_classes.present?
        existing_class = svg["class"]
        svg["class"] = existing_class.present? ? "#{existing_class} #{css_classes}" : css_classes
      end

      # Add any additional HTML attributes
      html_attributes.each do |key, value|
        svg[key.to_s.dasherize] = value.to_s
      end

      # Return the SVG element as HTML
      svg.to_html.html_safe
    end

    def build_css_classes
      classes = ["icon", "icon-tabler"]
      classes << "icon-tabler-#{name}"
      classes << custom_class if custom_class.present?
      classes.compact.join(" ")
    end

    def missing_icon_placeholder
      content_tag :svg,
                  xmlns: "http://www.w3.org/2000/svg",
                  width: size,
                  height: size,
                  viewBox: "0 0 24 24",
                  fill: "none",
                  stroke: "currentColor",
                  stroke_width: stroke_width,
                  stroke_linecap: "round",
                  stroke_linejoin: "round",
                  class: build_css_classes do
        content_tag(:title, "Icon not found: #{name}") +
          content_tag(:path, nil, d: "M12 12m-9 0a9 9 0 1 0 18 0a9 9 0 1 0 -18 0") +
          content_tag(:path, nil, d: "M9 9l6 6") +
          content_tag(:path, nil, d: "M15 9l-6 6")
      end
    end
  end
end
