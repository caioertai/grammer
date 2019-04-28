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

    def media
      # TODO: apply dependency injection
      Media.all_from(self)
    end

    DATA_PATHS = {
      biography: 'biography',
      business?: 'is_business_account',
      followers_count: %w[edge_followed_by count],
      following_count: %w[edge_follow count],
      full_name: 'full_name',
      id: 'id',
      private?: 'is_private',
      username: 'username',
      verified?: 'is_verified'
    }.freeze

    DATA_PATHS.each do |method_name, path|
      define_method(method_name) do
        @data.dig(*path)
      end
    end
  end
end
