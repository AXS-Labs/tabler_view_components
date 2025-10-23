# frozen_string_literal: true

class Tabler::CardComponentPreview < ViewComponent::Preview
  def default
    render(Tabler::CardComponent.new(title: "Card Title", status: "danger")) do |card|
      card.with_status
      card.with_header("Card Title", subtitle: "Card Subtitle")
      card.with_body do
        "Card content goes here"
      end
      card.with_body do
        "Card content 2 goes here"
      end
      card.with_footer do
        "Card footer content"
      end
    end
  end
end
