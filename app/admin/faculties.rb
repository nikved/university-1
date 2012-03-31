ActiveAdmin.register Faculty do

  index do
    column :name
    column(:description) { |faculty| faculty.description.truncate 100 }
    default_actions
  end

  show do
    attributes_table do
      row :name
      row :description
    end
  end

end
