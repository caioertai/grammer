# frozen_string_literal: true

module Grammer
  # Represents Instagram nodes (Users)
  class Node
    include HTTParty
    base_uri 'https://www.instagram.com'

    attr_reader :data

    def initialize(username)
      @data = extract_data(username)
    end

    private

    def extract_data(username)
      raw_page    = self.class.get("/#{username}")
      parsed_page = Nokogiri::HTML(raw_page)
      script      = parsed_page.at('body script')
      json_block  = script.text.match(/({.*})/)[1]
      json        = JSON.parse(json_block)
      json.dig('entry_data', 'ProfilePage', 0, 'graphql', 'user')
    end
  end
end
