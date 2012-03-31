ActiveAdmin.register Lesson do

  menu false

  actions :all, :except =>[:new]

  index do
    column(:time) { |lesson| lesson.time.strftime('%H:%M') }
    column :name
    column :day
    column :lecture
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :time
      f.input :name
      f.input :lecture
      f.input :room
      f.input :notes
    end
    f.buttons
  end

  show do
    attributes_table do
      row(:time) { |lesson| lesson.time.strftime('%H:%M') }
      row :name
      row :day
      row :lecture
      row :notes
      row(:schedule) { |l| link_to 'Schedule', [:admin, l.day.schedule] if l.day.try :schedule }
    end

  end

  controller do
    def create
      @lesson = Lesson.new(params[:lesson])
      ap time = Time.now.utc.change(:hour => params[:lesson][:'time(4i)'].to_i, :min => params[:lesson][:'time(5i)'].to_i, :sec => 0)
      @lesson.time = time
      create!
    end

    def update
      @lesson = Lesson.find(params[:id])
      @lesson.attributes = params[:lesson]
      @lesson.time = Time.now.utc.change(:hour => params[:lesson][:'time(4i)'].to_i, :min => params[:lesson][:'time(5i)'].to_i, :sec => 0)
      update!
    end
  end

end