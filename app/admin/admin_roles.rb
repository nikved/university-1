ActiveAdmin.register AdminRole do

  menu :if => proc { can? :manage, AdminRole }
  controller.authorize_resource

  form do |f|
    f.inputs do
      f.input :name
      f.input :ability_items, :as => :check_boxes
    end
    f.buttons
  end
 
end
