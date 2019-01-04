# frozen_string_literal: true

# Adds class macros to top level module
module Grammer
  def self.included(klass)
    klass.extend(Macros)
  end

  # Defines class macros
  module Macros
    def get_or_set_const(module_name)
      if const_defined?(module_name)
        const_get(module_name)
      else
        const_set(module_name, Module.new)
      end
    end

    def define_module_method(mod, method_name, opts)
      mod.class_eval do
        target_attribute = opts[:on]
        define_method(target_attribute) do
          instance_variable_name = "@#{target_attribute}"
          if instance_variable_defined?(instance_variable_name)
            instance_variable_get(instance_variable_name)
          else
            node = Node.new(send(method_name), service: opts[:service])
            instance_variable_set(instance_variable_name, node)
          end
        end
      end
    end

    def grammed_by(method_name, opts = {})
      mod = get_or_set_const(:"GammerMod#{object_id}")
      define_module_method(mod, method_name, opts)
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
