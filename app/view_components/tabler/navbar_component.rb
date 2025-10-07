module Tabler
  # Base component for Tabler UI components

  class NavbarComponent < BaseComponent
    renders_many :items, "Tabler::NavbarItemComponent"
  end
end
