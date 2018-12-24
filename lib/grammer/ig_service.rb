# frozen_string_literal: true

module Grammer
  # Handles Ig Requests
  class IgService
    include HTTParty
    base_uri 'https://www.instagram.com'

    def self.node(username)
      page = get("/#{username}")
      json = Nokogiri::HTML(page)
                     .at('body script')
                     .text.match(/({.*})/)[1]
      JSON.parse(json)
          .dig('entry_data', 'ProfilePage', 0, 'graphql', 'user')
    end
  end
end
