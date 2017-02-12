module Hydra
  # :nodoc:
  module Groupy
    # @api public
    #
    # Responsible for the configuration of the Hydra::Groupy
    class Configuration
      # @api public
      # @return an object that conforms to the Hydra::Groupy::Interfaces::GroupAdapterInterface
      attr_reader :group_adapter

      # @api public
      # @param input an object that conforms to the Hydra::Groupy::Interfaces::GroupAdapterInterface
      # @todo Enfroce interface when set
      attr_writer :group_adapter

      # @api public
      # @return an object that conforms to the Hydra::Groupy::Interfaces::RoleAdapterInterface
      attr_reader :role_adapter

      # @api public
      # @param input an object that conforms to the Hydra::Groupy::Interfaces::RoleAdapterInterface
      # @todo Enfroce interface when set
      attr_writer :role_adapter
    end
  end
end
