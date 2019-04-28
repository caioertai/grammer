# frozen_string_literal: true

##
# Main Module
module Grammer
  require 'httparty'
  require 'nokogiri'

  require 'grammer/data_forwardable'
  require 'grammer/ig_service'
  require 'grammer/macros'
  require 'grammer/media'
  require 'grammer/macro_handler'
  require 'grammer/node'

  ##
  # Initializes a node with a given username
  def self.node(username)
    Node.new(username)
  end

  ##
  # Extends class macros to main module
  def self.included(klass)
    klass.extend(Macros)
  end
end
