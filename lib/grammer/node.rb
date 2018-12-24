# frozen_string_literal: true

module Grammer
  # Represents Instagram nodes (Users)
  class Node
    attr_reader :data

    def initialize(username, attr = {})
      @data = attr[:raw_page] || extract_data(username)
    end

    private

    def extract_data(username)
      parsed_page = Nokogiri::HTML(IgService.node(username))
      script      = parsed_page.at('body script')
      json_block  = script.text.match(/({.*})/)[1]
      json        = JSON.parse(json_block)
      json.dig('entry_data', 'ProfilePage', 0, 'graphql', 'user')
    end
  end
end
