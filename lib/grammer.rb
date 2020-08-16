# frozen_string_literal: true

##
# Main Module
module Grammer
  require 'httparty'
  require 'nokogiri'

  require 'grammer/ig_service'
  require 'grammer/interface_adapter'
  require 'grammer/macros'
  require 'grammer/media'
  require 'grammer/macro_handler'
  require 'grammer/node'

  ##
  # Initializes a node with a given username
  def self.node(username, with: Node)
    with.new(username)
  end

  ##
  # Extends class macros to main module
  def self.included(klass)
    klass.extend(Macros)
  end
end
