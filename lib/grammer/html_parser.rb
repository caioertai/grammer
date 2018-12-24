# frozen_string_literal: true

module Grammer
  # Parses HTML pages for Services
  class HTMLParser < HTTParty::Parser
    def html
      Nokogiri::HTML(body)
    end
  end
end
