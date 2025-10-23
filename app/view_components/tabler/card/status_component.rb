module Tabler
  class Card::StatusComponent < BaseComponent
    attr_reader :status, :position

    def initialize(status = "blue", position: :top)
      @status = status
      @position = position
    end

    # Renders the card status wrapper.
    #
    # @return [String] the HTML output for the card status
    def call
      tag.div(class: "card-status-#{position} bg-#{status}")
    end
  end
end
