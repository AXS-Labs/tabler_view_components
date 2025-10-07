# frozen_string_literal: true

class Tabler::PageComponentPreview < ViewComponent::Preview
  def default
    render(Tabler::PageComponent.new) do
      "This is the page content 123"
    end
  end

  def with_navbar
    render(Tabler::PageComponent.new) do |component|
      component.with_navbar

      "This is the page content 123"
    end
  end
end
