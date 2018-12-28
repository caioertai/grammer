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

    def grammed_by(*methods)
      mod = get_or_set(:"GammerMod#{object_id}")
      mod.class_eval do
        methods.each do |method|
          define_method(method) do
            @_grammer_methods ||= {}
            if @_grammer_methods.include?(method)
              @_grammer_methods[method]
            else
              @_grammer_methods[method] = super()
            end
          end
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
