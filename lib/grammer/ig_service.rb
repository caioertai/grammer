# frozen_string_literal: true

module Grammer
  ##
  # Handles Ig Requests
  class IgService
    include HTTParty
    base_uri 'https://www.instagram.com'
    def initialize(options = {})
      @json_parser = options[:json_parser] || JSON
      @html_parser = options[:html_parser] || Nokogiri
    end

    ##
    # Requests Instagram node information with a given username.
    def node(username)
      page = self.class.get("/#{username}")
      json = @html_parser.parse(page)
                         .at('body script')
                         .text.match(/({.*})/)[1]
      @json_parser.parse(json)
                  .dig('entry_data', 'ProfilePage', 0, 'graphql', 'user') || {}
    end
  end
end
