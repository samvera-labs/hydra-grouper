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
class User
  def groups
    @groups ||= Hydra::Groupy.group_adapter.groups_for(user: self)
  end

  def institution_functions
    @institution_functions ||= Hydra::Groupy.institution_adapter.institution_functions_for(user: self)
  end

  delegate :admin?, :superadmin?, to: :institution_functions
end
```

## For Hyku

```ruby
# Hyku
class HykuGroupRoleShimAdapter
  def groups_for(user:)
    user.roles.map do |role|
      GroupValueObject.new(name: role.name, key: role.key)
    end
  end
  def all_groups
  end
  def institution_functions_for(user:)
  end
  def all_institution_functions
  end
end

Hydra::Groupy.configure do |config|
  shim = HykuGroupRoleShimAdapter.new
  config.group_adapter = shim
  config.institution_function_adapter = shim
end
```
