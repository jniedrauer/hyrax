module Hyrax
  module Ability
    module CollectionTypeAbility
      def collection_type_abilities
        can :manage, CollectionType if admin?
        can :create_collection_of_type, CollectionType do |collection_type|
          Hyrax::CollectionTypes::PermissionsService.can_create_collection_of_type?(user: current_user, collection_type: collection_type)
        end
      end
    end
  end
end