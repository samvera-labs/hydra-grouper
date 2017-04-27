module Hydra
  module Grouper
    # A container object that exposes convenience methods related to the underlying institution_functions set.
    #
    # For a given InstitutionFunctionSet we can ask "are you an admin?"
    class InstitutionFunctionSet
      def initialize(institution_functions: [])
        @institution_functions = institution_functions
      end

      def admin?
        @institution_functions.detect { |institution_function| institution_function.name == 'admin' }
      end

      def superadmin?
        @institution_functions.detect { |institution_function| institution_function.name == 'superadmin' }
      end
    end
  end
end
