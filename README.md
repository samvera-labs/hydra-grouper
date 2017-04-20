# Hydra::Groupy

[![Gem Version](https://badge.fury.io/rb/hydra-groupy.png)](https://badge.fury.io/rb/hydra-groupy)
[![Build Status](https://travis-ci.org/projecthydra-labs/hydra-groupy.png?branch=master)](https://travis-ci.org/projecthydra-labs/hydra-groupy)
[![Code Climate](https://codeclimate.com/github/projecthydra-labs/hydra-groupy/badges/gpa.svg)](https://codeclimate.com/github/projecthydra-labs/hydra-groupy)
[![Test Coverage](https://codeclimate.com/github/projecthydra-labs/hydra-groupy/badges/coverage.svg)](https://codeclimate.com/github/projecthydra-labs/hydra-groupy/coverage)
[![Documentation Status](http://inch-ci.org/github/projecthydra-labs/hydra-groupy.svg?branch=master)](http://inch-ci.org/github/projecthydra-labs/hydra-groupy)
[![APACHE 2 License](http://img.shields.io/badge/APACHE2-license-blue.svg)](./LICENSE)
[![Contributing Guidelines](http://img.shields.io/badge/CONTRIBUTING-Guidelines-blue.svg)](./CONTRIBUTING.md)

## Details

A work in progress. See the example implementation for details.

### Glossary

### Example Implementation

```ruby
module Hyrax # This should perhaps be pushed into the Hydra namespace.
  module ApplicationAbility
    # @api public
    #
    # Applies the functional abilities to the given ability based on the given ability's current_user.
    # This allows for us to plugin additional abilities in implementing applications without the explicit need
    # to re-open the Ability class. (more on that later).
    #
    # @param [Ability] ability - an object that implements the CanCan::Ability interface
    # @return [Ability]
    def self.append_abilities_to!(ability:)
      functionality_abilities_for(user: ability.current_user).each do |function_role|
        functional_abilitiesnew(ability: ability).apply
      end
      ability
    end

    # @api public
    #
    # For the given user, return an enumerable of all of the ApplicationAbility objects
    # that apply, based on the user and their group memberships relation to their Functional Role
    # at the institution
    #
    # @param [User] user for which we are looking up their assigned functional abilities.
    # @return [Array<Hyrax::ApplicationAbility::BaseApplicationAbility]
    # @note This is the place for the new and improved user groups to be leveraged
    def self.functionality_abilities_for(user:)
      # TODO: Define an implementation of how this is looked up
    end

    # An abstract class that defines the interface for implementations of a ApplicationAbility.
    # A ApplicationAbility is a name-able atomic unit of permissions.
    class BaseApplicationAbility
      extend Forwardable
      def initialize(ability:)
        @ability = ability
      end
      def_delegators :@ability, :can, all # etc.

      def apply
        raise NotImplementedError, "Subclasses must implement #apply"
      end
    end

    # The set of specific cans and cannots that are applicable for an Admin.
    class AdminApplicationAbility < BaseApplicationAbility
      def apply
        # NOTE: We are removing the short-circuit tradition of a guard `return unless admin?`
        #       This ApplicationAbility will not be applied if it is not one of your functional roles at the institution.
        can :read, :admin_dashboard
      end
    end
  end

  module Ability
    extend ActiveSupport::Concern

    # @note assumes we are previously including Hydra::Ability
    def hydra_default_permissions
      super
      apply_functional_abilities
    end

    private

    def apply_functional_abilities
      Hyrax::ApplicationAbility.append_abilities_to!(ability: self)
    end
  end
end
```
