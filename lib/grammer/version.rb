# frozen_string_literal: true

module Grammer
  # Describes version for gemspec
  module VERSION
    MAJOR = 0
    MINOR = 1
    PATCH = 0
    BUILD = 'edge'

    STRING = [MAJOR, MINOR, PATCH, BUILD].compact.join('.')

    def self.version
      STRING
    end
  end
end
