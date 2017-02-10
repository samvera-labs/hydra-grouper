require 'rails/railtie'

module Hydra
  module Groupy
    # Connect into the boot sequence of a Rails application
    class Railtie < Rails::Railtie
      config.to_prepare do
        Hydra::Groupy.configure!
      end
    end
  end
end
