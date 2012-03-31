ActiveAdmin.register Day do

  menu false

  show do
    attributes_table do
      row :name
      row :schedule
    end
  end

end
