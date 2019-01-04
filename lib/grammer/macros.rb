# frozen_string_literal: true

# Adds class macros to top level module
module Grammer
  def self.included(klass)
    klass.extend(Macros)
  end

  # Defines class macros
  module Macros
    def get_or_set_const(module_name)
      const_set(module_name, Module.new) unless const_defined?(module_name)
      const_get(module_name)
    end

    def grammed_by(method, options = {})
      mod = get_or_set_const(:"GammerMod#{object_id}")
      mod.class_eval do
        target_attribute = options[:on]
        define_method(target_attribute) do
          username = send(method)
          instance_var = "@#{target_attribute}"

          unless instance_variable_defined?(instance_var)
            instance_variable_set(
              instance_var,
              Node.new(username, service: options[:service])
            )
          end
          instance_variable_get(instance_var)
        end
      end
      prepend mod
    end

    def grammed_by_class_method(*methods)
      singleton_class.class_eval do
        include Grammer
        grammed_by(*methods)
      end
    end
  end
end
