module Hydra
  module Groupy
    # A simple PORO that defines what an agent of an institution can do?
    #
    # The concept formerly known as Roles (because Roles and Groups are getting conflated)
    class InstitutionFunction
      attr_reader :name, :description, :key
    end
  end
end
