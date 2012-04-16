class AdminRole < ActiveRecord::Base

  has_many :admin_users
  has_and_belongs_to_many :ability_items, :uniq => true

  validates_presence_of :name

  def self.teacher
    @teacher ||= AdminRole.find_or_create_by_name('Teacher').tap do |role| 
      role.ability_items << AbilityItem.find_by_data('Schedule')
      role.ability_items << AbilityItem.find_by_data('Lesson')
      role.ability_items << AbilityItem.find_by_data('Day')
      role.ability_items << AbilityItem.find_by_data('AdminUser')
    end
  end

  def self.super_admin
    @super_admin ||= find_or_create_by_name('Super Admin').tap do |role|
      role.ability_items << AbilityItem.all 
    end
  end

end
