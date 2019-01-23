# frozen_string_literal: true

##
# Main Module
module Grammer
  require 'httparty'
  require 'nokogiri'

  require 'grammer/ig_service'
  require 'grammer/macros'
  require 'grammer/node'

  def self.included(klass)
    klass.extend(Macros)
  end
end
