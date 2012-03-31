module ApplicationHelper

  def nav_items
    if logged_in?
      items = { 'Personal Information' => student_path(current_user) }
      items.merge!('Schedules' => schedules_path) if current_user.group
      items
    else
      Hash.new
    end
  end

  def nav_right_items
    if logged_in?
      { 'Logout' => logout_path }
    else
      {}
    end
  end

  def tooltip(text, len = 40)
    link_to text.truncate(45), '#', :rel => 'tooltip', :'data-original-title' => text
  end

  def flash_messages
    ''.html_safe.tap do |content|
      [:success, :warning, :error].each do |type|
        if flash[type]
          content << content_tag(:div, :class => "alert alert-#{type}") do
            %(<a class="close" data-dismiss="alert">&#xD7;</a>#{flash[type]}).html_safe
          end
        end
      end
    end
  end

end
