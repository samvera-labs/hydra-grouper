require "hydra/groupy/version"
require 'hydra/groupy/configuration'
require 'hydra/groupy/exceptions'
require 'hydra/groupy/railtie' if defined?(Rails)

# Namespace for projecthydra modules
module Hydra
  # A namespace module for configuring and managing group and role adapters
  module Groupy
    # @api public
    # @return an object that conforms to the Hydra::Groupy::RoleAdapterInterface
    def self.group_adapter
      configuration.group_adapter
    end

    # @api public
    # @return an object that conforms to the Hydra::Groupy::GroupAdapterInterface
    def self.role_adapter
      configuration.role_adapter
    end

    # @api public
    #
    # Contains the Hydra::Groupy configuration information that is referenceable from wit
    #
    # @return [Hydra::Group::Configuration]
    # @see Hydra::Group::Configuration
    def self.configuration
      @configuration ||= Configuration.new
    end

    # @api public
    #
    # Capture the configuration information
    #
    # @yield [Hydra::Group::Configuration]
    # @see Hydra::Group::Configuration
    # @see .configuration
    # @see Hydra::Group::Railtie
    def self.configure(&block)
      @configuration_block = block
      # The Rails load sequence means that some of the configured Targets may
      # not be loaded; As such I am not calling configure! instead relying on
      # Hydra::Group::Railtie to handle the configure! call
      configure! unless defined?(Rails)
    end

    # Responsible for performing the configuration operation.
    #
    # @return [TrueClass] if configuration was performed
    # @return [FalseClass] if configuration was not performed
    # @api private
    def self.configure!
      return false unless @configuration_block.respond_to?(:call)
      @configuration_block.call(configuration)
      @configuration_block = nil
      true
    end
  end
end
