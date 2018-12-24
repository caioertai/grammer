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
      page        = service.node(username)
      script      = page.at('body script')
      json_block  = script.text.match(/({.*})/)[1]
      json        = JSON.parse(json_block)
      json.dig('entry_data', 'ProfilePage', 0, 'graphql', 'user')
    end
  end
end
