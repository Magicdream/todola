class ApplicationFormBuilder < ActionView::Helpers::FormBuilder
  def error_messages_on(attribute)
    if object.errors.include?(attribute)
      errors = object.errors[attribute].join("<br/>")
      %{<div class="help-inline">#{errors}</div>}.html_safe
    end
  end

  def control_group(attribute, &block)
    content = @template.capture(&block)
    error_class = object.errors.include?(attribute) && 'error'

    %{<div class="control-group #{error_class}">#{content}</div>}.html_safe
  end
end