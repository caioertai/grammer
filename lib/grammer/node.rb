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

    ##
    # Returns node's id
    def id
      @data.dig('id')
    end

    ##
    # Returns node's biography
    def biography
      @data.dig('biography')
    end

    ##
    # Returns node's followers count
    def followers_count
      @data.dig('edge_followed_by', 'count')
    end

    ##
    # Returns node's username
    def username
      @data.dig('username')
    end

    ##
    # Returns node's is_private
    def private?
      @data.dig('is_private')
    end

    ##
    # Returns node's is_verified
    def verified?
      @data.dig('is_verified')
    end
  end
end
