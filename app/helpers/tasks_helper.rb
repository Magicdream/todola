module TasksHelper
  TASK_PRIORITY_TO_CLASS = {
    high: :important,
    medium: :warning,
    low: :info
  }

  def tasks_sort_link(attribute)
    title = Task.human_attribute_name(attribute)
    current_attribute = (params[:sort_by] == attribute)
    css_class = "current" if current_attribute
    direction = (current_attribute && params[:direction] == "asc") ? "desc" : "asc"
    arrow = %{<i class="icon-arrow-#{direction == 'asc' ? :up : :down}"></i>} if current_attribute

    link_to "#{title} #{arrow}".html_safe, {sort_by: attribute, direction: direction}, 
      { remote: true, class: css_class }
  end

  def task_priority_label(task)
    if task.priority
      text = t(task.priority_sym, scope: 'task.priorities')
      label_class = TASK_PRIORITY_TO_CLASS[task.priority_sym]

      %{<span class="label label-#{label_class}">#{text}</span>}.html_safe
    end
  end
end