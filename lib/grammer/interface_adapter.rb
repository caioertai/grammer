# frozen_string_literal: true

module Grammer
  ##
  # Allows data forwarding paths to be defined, abstracting some of the
  # repetitive reader definitions away from the class
  module InterfaceAdapter
    def attr_data_forwarder(paths)
      paths.each do |method_name, path|
        define_method(method_name) do
          @data.dig(*path)
        end
      end
    end
  end
end
