# frozen_string_literal: true

module Grammer
  # Handles Ig Requests
  class IgService
    include HTTParty
    parser HTMLParser
    base_uri 'https://www.instagram.com'

    def self.node(username)
      get("/#{username}")
    end
  end
end
