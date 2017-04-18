# Hydra::Groupy

[![Gem Version](https://badge.fury.io/rb/hydra-groupy.png)](https://badge.fury.io/rb/hydra-groupy)
[![Build Status](https://travis-ci.org/projecthydra-labs/hydra-groupy.png?branch=master)](https://travis-ci.org/projecthydra-labs/hydra-groupy)
[![Code Climate](https://codeclimate.com/github/projecthydra-labs/hydra-groupy/badges/gpa.svg)](https://codeclimate.com/github/projecthydra-labs/hydra-groupy)
[![Test Coverage](https://codeclimate.com/github/projecthydra-labs/hydra-groupy/badges/coverage.svg)](https://codeclimate.com/github/projecthydra-labs/hydra-groupy/coverage)
[![Documentation Status](http://inch-ci.org/github/projecthydra-labs/hydra-groupy.svg?branch=master)](http://inch-ci.org/github/projecthydra-labs/hydra-groupy)
[![APACHE 2 License](http://img.shields.io/badge/APACHE2-license-blue.svg)](./LICENSE)
[![Contributing Guidelines](http://img.shields.io/badge/CONTRIBUTING-Guidelines-blue.svg)](./CONTRIBUTING.md)

Like ZOMG! It's the long awaited separation of groups and roles for Project Hydra.

[More details here](https://docs.google.com/document/d/1hXsu_LwI28a2vzWhMDDtEzLnXjyE0Bk6U_wY745IKFA/edit?usp=sharing).

## Details

Difference between Roles and Groups. Groups are a proxy for a set of users. Roles are a proxy for a set of actions. When naming groups, prefer the use nouns (admin, editor). Roles should be verbs (administrate, editing ETDs) and could include scoping direct objects for clarification.

* `Hydra::Groupy.group_adapter` - Is the end point for common methods related to groups.
* `Hydra::Groupy.role_adapter` - Is the end point for common methods related to roles.

### Example Implementation

```ruby
# New proposal that changes the scope of Hydra::Groupy
module Hydra::FunctionalRoles
  class Admin
    attr_reader :ability

    def initialize(ability:)
      @ability = ability
    end

    def apply
      can :manage, all
    end
    delegate :can, :cannot, :all, to: :ability
  end
end

class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.blank?
    # Hyrax::FunctionalRoles.apply_ability_logic_to(ability: self)
    # Hyrax::FunctionalRoles.applicable_for(ability: self)
    apply_functional_roles_for(user: user)
  end

  def apply_functional_roles_for(user:)
    # TODO: Change to be a query for the given user
    [Hyrax::FunctionalRoles::Admin].each do |klass|
      klass.new(ability: self).apply
    end
  end
end
```

"AgentFunctionalRole" --< "FunctionalRole" --< "FunctionalRoleAbility" >-- "Hydra::FunctionalRoles Ruby Class"
