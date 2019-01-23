# frozen_string_literal: true

module Grammer
  ##
  # = Macros
  # Defines class macros
  module Macros
    ##
    # Gets constant value or sets it if it haven't been defined before.
    def get_or_set_const(module_name)
      if const_defined?(module_name)
        const_get(module_name)
      else
        const_set(module_name, Module.new)
      end
    end

    ##
    # Defines methods on singleton modules in order to handle macros
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

    ##
    # Main initializing class macro for the module.
    # Defines a Node instance on the given name.
    def grammed_by(method_name, opts = {})
      mod = get_or_set_const(:"GammerMod#{object_id}")
      define_module_method(mod, method_name, opts)
      prepend mod
    end
  end
end
