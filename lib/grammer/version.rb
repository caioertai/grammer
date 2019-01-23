# frozen_string_literal: true

module Grammer
  ##
  # = Version
  # Describes version for gemspec
  module VERSION
    MAJOR = 0
    MINOR = 2
    PATCH = 1
    BUILD = 'edge'

    STRING = [MAJOR, MINOR, PATCH, BUILD].compact.join('.')

    def self.version
      STRING
    end
  end
end
