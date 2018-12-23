# frozen_string_literal: true

module Grammer
  # Represents Instagram nodes (Users)
  class Node
    include HTTParty
    base_uri 'https://www.instagram.com'

    def initialize(username)
      @username = username
      @userpath = "/#{username}"
    end

    def json
      raw_page    = self.class.get(@userpath)
      parsed_page = Nokogiri::HTML(raw_page)
      script      = parsed_page.at('body script')
      json_block  = script.text.match(/({.*})/)[1]
      json        = JSON.parse(json_block)
      @data       = json.dig('entry_data', 'ProfilePage', 0, 'graphql', 'user')
    end
  end
end
