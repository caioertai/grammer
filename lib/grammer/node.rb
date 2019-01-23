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
    # Helper for displaying node's biography
    def biography
      @data.dig('biography')
    end

    ##
    # Helper for displaying node's followers count
    def followers_count
      @data.dig('edge_followed_by', 'count')
    end
  end
end
