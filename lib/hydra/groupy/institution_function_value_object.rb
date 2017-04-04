module Hydra
  module Groupy
    # A simple PORO that defines what an agent of an institution can do?
    #
    # The concept formerly known as Roles (because Roles and Groups are getting conflated)
    class InstitutionFunctionValueObject
      include Dry::Equalizer(:key)

      def initialize(name:, key:)
        @name = name
        @key = key
      end

      attr_reader :name, :key
    end
  end
end
