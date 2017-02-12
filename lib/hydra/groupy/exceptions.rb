module Hydra
  module Groupy
    # The container for exceptions for Hydra::Groupy
    module Exceptions
      # Isolating a common exception to assist with debugging.
      class RuntimeError < ::RuntimeError
      end
    end
  end
end
