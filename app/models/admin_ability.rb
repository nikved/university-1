class AdminAbility
  include CanCan::Ability

  def initialize(admin)
    admin ||= AdminUser.new
    admin.admin_role.ability_items.each do |ability|
      can :manage, ability.data.constantize
    end
end
end
