module Hydra
  module Groupy
    # Exposes the interface we are expecting for Group interactions
    class GroupAdapterInterface
      # @return [Array<GroupValueOjbect>] A list of unique GroupValueObject
      def all_groups; end

      # @param [#user_key] user
      # @return [Array<GroupValueOjbect>] A list of unique GroupValueObject
      def groups_for(user:); end
    end
  end
end
