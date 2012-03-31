ActiveAdmin.register Group do

  scope(:all, :default => true) { |groups| groups.includes [:faculty, :branch, :department] }

  index do
    column :faculty, :sortable => 'faculties.name'
    column :number
    column :branch, :sortable => 'branches.name'
    column :department, :sortable => 'departments.name'
    column :start_year
    column(:schedule) { |group| link_to 'schedule', [:admin, group.schedule] }
    default_actions
  end

  show do
    attributes_table do
      row :faculty
      row :number
      row :branch
      row :department
      row :start_year
      row(:schedule) { |group| link_to 'schedule', [:admin, group.schedule] }
    end
  end

  form do |f|
    f.inputs do
      f.input :faculty
      f.input :number
      f.input :branch
      f.input :department
      f.input :start_year, :as => :select, :collection => (-10..10).map { |i| Date.today.year + i }
    end
    f.buttons
  end

end
