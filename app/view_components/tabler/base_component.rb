module Tabler
  # Base component for all Tabler UI components.
  #
  # This class serves as the foundation for all Tabler ViewComponents,
  # providing common functionality and ensuring consistent behavior
  # across the component library.
  #
  # @abstract Subclass and override methods to implement custom Tabler components
  #
  # @example Creating a custom Tabler component
  #   class MyCustomComponent < Tabler::BaseComponent
  #     def initialize(title:)
  #       @title = title
  #     end
  #   end
  class BaseComponent < ViewComponent::Base
  end
end
