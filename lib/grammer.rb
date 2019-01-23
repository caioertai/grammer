# frozen_string_literal: true

##
# Main Module
module Grammer
  require 'httparty'
  require 'nokogiri'

  require 'grammer/ig_service'
  require 'grammer/macros'
  require 'grammer/node'

  ##
  # Extends class macros to main module 
  def self.included(klass)
    klass.extend(Macros)
  end
end
