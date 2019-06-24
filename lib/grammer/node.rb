# frozen_string_literal: true

module Grammer
  ##
  # = Node
  # Represents Instagram nodes (accounts)
  class Node
    extend DataForwardable
    attr_data_forwarder biography: 'biography',
                        business?: 'is_business_account',
                        followers_count: %w[edge_followed_by count],
                        following_count: %w[edge_follow count],
                        full_name: 'full_name',
                        id: 'id',
                        private?: 'is_private',
                        username: 'username',
                        verified?: 'is_verified'

    ##
    # Service used for requesting instagram info
    attr_reader :service, :username

    ##
    # Creates a new instagram node defined by its username.
    def initialize(username, attr = {})
      @username    = username
      @media_class = attr[:media_class] || Media
      @service     = attr[:service] || IgService.new
    end

    ##
    # General Instagram hash of data from the node
    def data
      @data ||= service.node(username)
    end

    def media
      @media_class.all_from(self)
    end
  end
end
