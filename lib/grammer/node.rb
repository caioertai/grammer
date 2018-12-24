# frozen_string_literal: true

module Grammer
  # Represents Instagram nodes (Users)
  class Node
    attr_reader :data, :service

    def initialize(username, attr = {})
      @service = attr[:service] || IgService
      @data    = extract_data(username)
    end

    private

    def extract_data(username)
      service.node(username)
    end
  end
end
