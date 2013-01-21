$ ->
  $('.tasks')
    # radio-button can be unchecked
    .on 'click.button.data-api.custom', '.new-task .priorities .btn.active', ->
      $(@).removeClass('active')
      false

    # set priority value from active button
    .on 'submit', 'form.new-task', ->
      priority = $(@).find('.priorities .btn.active').data('value')
      $('#task_priority').val(priority)

    .on 'click', '.task .complete-task input', ->
      $(@).parents('form').submit()