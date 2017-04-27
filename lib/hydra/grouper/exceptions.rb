module Hydra
  module Grouper
    # The container for exceptions for Hydra::Grouper
    module Exceptions
      # Isolating a common exception to assist with debugging.
      class RuntimeError < ::RuntimeError
      end
    end
  end
end
