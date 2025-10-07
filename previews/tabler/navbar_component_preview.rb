# frozen_string_literal: true

class Tabler::NavbarComponentPreview < ViewComponent::Preview
  def default
    render(Tabler::NavbarComponent.new)
  end
end
