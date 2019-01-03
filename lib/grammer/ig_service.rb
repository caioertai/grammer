# frozen_string_literal: true

module Grammer
  # Handles Ig Requests
  class IgService
    include HTTParty
    base_uri 'https://www.instagram.com'

    def node(username)
      page = self.class.get("/#{username}")
      json = Nokogiri.parse(page)
                     .at('body script')
                     .text.match(/({.*})/)[1]
      JSON.parse(json)
          .dig('entry_data', 'ProfilePage', 0, 'graphql', 'user') || {}
    end
  end
end
