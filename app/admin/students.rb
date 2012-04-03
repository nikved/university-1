ActiveAdmin.register Student do

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

end
