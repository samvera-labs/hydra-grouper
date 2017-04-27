module Hydra
  # :nodoc:
  module Grouper
    # @api public
    #
    # Responsible for the configuration of the Hydra::Grouper
    class Configuration
      # @api public
      # @return an object that conforms to the Hydra::Grouper::Interfaces::GroupAdapterInterface
      attr_reader :group_adapter

      # @api public
      # @param input an object that conforms to the Hydra::Grouper::Interfaces::GroupAdapterInterface
      # @todo Enfroce interface when set
      attr_writer :group_adapter

      # @api public
      # @return an object that conforms to the Hydra::Grouper::Interfaces::InstitutionFunctionAdapterInterface
      attr_reader :institution_function_adapter

      # @api public
      # @param input an object that conforms to the Hydra::Grouper::Interfaces::InstitutionFunctionAdapterInterface
      # @todo Enfroce interface when set
      attr_writer :institution_function_adapter
    end
  end
end
