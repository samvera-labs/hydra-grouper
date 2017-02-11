require "hydra/groupy/version"
require 'hydra/groupy/configuration'

module Hydra
  # A namespace module for configuring and managing group and role adapters
  module Groupy
    # @api public
    #
    # Contains the Curate::Indexer configuration information that is referenceable from wit
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

    # @api private
    def self.configure!
      return false unless @configuration_block.respond_to?(:call)
      @configuration_block.call(configuration)
      @configuration_block = nil
    end
  end
end
