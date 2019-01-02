# frozen_string_literal: true

module Grammer
  # Represents Instagram nodes (Users)
  class Node
    attr_reader :data, :service

    def initialize(username, attr = {})
      @service = attr[:service] || IgService.new
      @data    = service.node(username)
    end

    def biography
      @data.dig('biography')
    end

    def followers_count
      @data.dig('edge_followed_by', 'count')
    end
  end
end
