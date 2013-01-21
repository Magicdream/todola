module TasksHelper
  TASK_PRIORITY_TO_CLASS = {
    high: :important,
    medium: :warning,
    low: :info
  }

  def task_priority_label(task)
    if task.priority
      text = t(task.priority_sym, scope: 'task.priorities')
      label_class = TASK_PRIORITY_TO_CLASS[task.priority_sym]

      %{<span class="label label-#{label_class}">#{text}</span>}.html_safe
    end
  end
end