module Hydra
  module Groupy
    # Exposes the interface we are expecting for InstitutionFunction interactions
    class InstitutionFunctionAdapterInterface
      # @return [Array<InstitutionFunctionValueOjbect>] A list of unique InstitutionFunctionValueOjbect
      def all_institution_functions; end

      # @param [#user_key] user
      # @return [InstitutionFunctionSet>]
      def institution_functions_for(user:); end
    end
  end
end
