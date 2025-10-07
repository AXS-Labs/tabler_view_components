module Tabler
  class NavbarItemComponent < ViewComponent::Base
    attr_reader :title, :href, :active

    alias_method :to, :href
    alias_method :active?, :active

    def initialize(title, href = '#', active: false)
      @title = title
      @href = href
      @active = active
    end
  end
end
