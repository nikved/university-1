ActiveAdmin.register Schedule do

  actions :all, :except => [:new, :create, :destroy, :edit]
  scope(:all, :default => true) { |sc| sc.includes :group }

  index do
    column :group, :sortable => 'groups.number'
    default_actions
  end

  show :title => :name do |schedule|
    schedule.days.each do |day|
      div do
        h2 { day.name }
        table_for day.lessons, :class => 'index_table' do
          column :time, :strftime
          column :name
          column :teacher
          column(:'lecture/practice') { |lesson| lesson.lecture? ? status_tag('lecture', :error) : status_tag('practice') }
          column :room
          column :notes
          column '' do |lesson|
            links = ''.html_safe
            links += link_to 'View', admin_lesson_path(lesson), :class => 'member_link view_link'
            links += link_to 'Edit', edit_admin_lesson_path(lesson), :class => 'member_link edit_link'
            links += link_to 'Delete', admin_lesson_path(lesson), :method => :delete, :confirm => 'Are you sure you want to delete this?', :class => 'member_link delete_link'
            links
          end
        end
      end
    end

    div do
      active_admin_form_for [:admin, lesson] do |f|
        f.inputs do
          f.input :day, :as => :select, :collection => schedule.days
          f.input :time
          f.input :name
          f.input :teacher
          f.input :lecture
          f.input :room
          f.input :notes
        end
        f.buttons
      end
    end
  end

  controller do
    def show
      @lesson = Lesson.new
      @schedule = Schedule.find(params[:id])
      show!
    end
  end

end
