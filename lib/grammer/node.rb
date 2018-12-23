# frozen_string_literal: true

module Grammer
  # Represents Instagram nodes (Users)
  class Node
    include HTTParty
    base_uri 'https://www.instagram.com/'

    def initialize(username)
      
    end
  end
end
