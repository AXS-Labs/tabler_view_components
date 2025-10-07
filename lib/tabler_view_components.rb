require "tabler/view_components/version"
require "tabler/view_components/engine"
require "view_component"

module Tabler::ViewComponents
  class Error < StandardError; end

  # tabler/view_components root directory.
  def self.root
    Pathname(File.expand_path(File.join("..", ".."), __dir__))
  end
end
