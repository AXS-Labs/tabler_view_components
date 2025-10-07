module Tabler
  # Base component for Tabler UI components

  class PageComponent < BaseComponent
    renders_many :navbars, "Tabler::NavbarComponent"
  end
end
