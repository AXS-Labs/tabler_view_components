module Tabler
  module Page
    class PrimaryButtonComponent < Tabler::ButtonComponent
      def initialize(label, url: "#", **options)
        super(label, url: url, color: "primary", **options)
      end
    end
  end
end
