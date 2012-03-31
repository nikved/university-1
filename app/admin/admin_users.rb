ActiveAdmin.register AdminUser do

  index do
    column :name
    column :email
    column :last_sign_in_at
    column :last_sign_in_ip
    default_actions
  end

  show do |admin|
    attributes_table do
      row :name
      row :email
      row :last_sign_in_at
      row :last_sign_in_ip
    end
  end
 
  form do |f|
    f.inputs do
      f.input :name, :label => 'Full name'
      f.input :email, :input_html => { :disabled => f.object.persisted? }
    end
    f.buttons
  end
  
end
