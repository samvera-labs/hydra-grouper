require 'rails/railtie'

module Hydra
  module Grouper
    # Connect into the boot sequence of a Rails application
    class Railtie < Rails::Railtie
      config.to_prepare do
        Hydra::Grouper.configure!
      end
    end
  end
end
