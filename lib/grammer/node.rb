# frozen_string_literal: true

module Grammer
  ##
  # = Node
  # Represents Instagram nodes (accounts)
  class Node
    ##
    # General Instagram hash of data from the node
    attr_reader :data

    ##
    # Service used for requesting instagram info
    attr_reader :service

    ##
    # Creates a new instagram node defined by its username.
    def initialize(username, attr = {})
      @service = attr[:service] || IgService.new
      @data    = service.node(username)
    end

    DATA_PATHS = {
      id: 'id',
      biography: 'biography',
      followers_count: %w[edge_followed_by count],
      username: 'username',
      private?: 'is_private',
      verified?: 'is_verified'
    }.freeze

    DATA_PATHS.each do |method_name, path|
      define_method(method_name) do
        @data.dig(*path)
      end
    end
  end
end
