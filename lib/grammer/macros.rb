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
    # Main initializing class macro for the module.
    # Defines a Node instance on the given name.
    def grammed_by(method_name, options = {})
      mod = get_or_set_const(:"GammerMod#{object_id}")
      mod.class_exec(method_name, options, &Grammer::MacroHandler::DEFINE)
      prepend mod
    end
  end
end
