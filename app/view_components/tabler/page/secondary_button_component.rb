module Tabler
  module Page
    class SecondaryButtonComponent < Tabler::ButtonComponent
      def initialize(label, url: "#", **options)
        super(label, url: url, color: "", **options)
      end
    end
  end
end
