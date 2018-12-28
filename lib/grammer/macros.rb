# frozen_string_literal: true

# Adds class macros to top level module
module Grammer
  def self.included(klass)
    klass.extend(Macros)
  end

  # Defines class macros
  module Macros
    def get_or_set(instance_var)
      const_set(instance_var, Module.new) unless const_defined?(instance_var)
      const_get(instance_var)
    end

    def grammed_by(method, options = {})
      mod = get_or_set(:"GammerMod#{object_id}")
      mod.class_eval do
        define_method(options[:on]) do
          username = instance_variable_get("@#{method}")
          instance_variable_set("@#{options[:on]}", Node.new(username)) unless instance_variable_get("@#{options[:on]}")
          instance_variable_get("@#{options[:on]}")
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
