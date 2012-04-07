ActiveAdmin.register Student do

  menu :if => proc { can? :manage, Student }
  controller.authorize_resource

  actions :all, :except => [:new, :create]

  index do
    column :username
    column :email
    column :first_name
    column :last_name
    column :birthday
    column :group
    default_actions
  end

  show do
    attributes_table do
      row :username
      row :email
      row :first_name
      row :last_name
      row :birthday
      row :group
    end
  end

  form do |f|
    f.inputs do
      f.input :username
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :birthday, :as => :datepicker, :hint => 'yyyy-mm-dd'
      f.input :group
    end

    f.buttons
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :group

end
