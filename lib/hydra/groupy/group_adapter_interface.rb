module Hydra
  module Groupy
    # Exposes the interface we are expecting for Group interactions
    class GroupAdapterInterface
      # @return [Array<GroupValueOjbect>] A list of unique GroupValueObject
      def all_groups; end

      # @param [String] user_key
      # @return [Array<GroupValueOjbect>] A list of unique GroupValueObject
      def groups_for(user_key:); end

      # @param [String] group_key
      # @return [Array<String>] A list of user keys
      def members_of(group_key:); end
    end
  end
end
