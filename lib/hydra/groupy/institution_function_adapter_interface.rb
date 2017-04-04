module Hydra
  module Groupy
    # Exposes the interface we are expecting for InstitutionFunction interactions
    class InstitutionFunctionAdapterInterface
      # @return [Array<InstitutionFunctionValueOjbect>] A list of unique InstitutionFunctionValueOjbect
      def all_institution_functions; end

      # @param [String] user_key
      # @return [InstitutionFunctionSet>]
      def institution_functions_for(user_key:); end

      # @param [String] institution_function_key
      # @return [Array<String>]
      def members_of(institution_function_key:); end
    end
  end
end
