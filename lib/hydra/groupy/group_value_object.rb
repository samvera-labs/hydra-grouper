module Hydra
  module Groupy
    # A simple PORO that defines the basics of what we mean by a group.
    #
    # A Group is a set of people/users
    class GroupValueObject
      attr_reader :name, :description, :key
    end
  end
end
