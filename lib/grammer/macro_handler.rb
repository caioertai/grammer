# frozen_string_literal: true

module Grammer
  ##
  # Build procs for singleton method definitions
  class MacroHandler
    DEFINE = proc do |method_name, options|
      define_method(options[:on]) do
        instance_variable_name = "@#{options[:on]}"
        if instance_variable_defined?(instance_variable_name)
          instance_variable_get(instance_variable_name)
        else
          node = Node.new(send(method_name), service: options[:service])
          instance_variable_set(instance_variable_name, node)
        end
      end
    end
  end
end
