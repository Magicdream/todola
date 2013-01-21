$ ->
  $.fn.initTaskForm = ->
    $(@).find('input.due-date').datepicker()
    # radio-button can be unchecked
    $(@).on 'click.button.data-api.custom', '.priorities .btn.active', ->
      $(@).removeClass('active')
      false
    $(@).on 'submit', ->
      priority = $(@).find('.priorities .btn.active').data('value')
      $(@).find("input[name='task[priority]']").val(priority)
      true

  $('#new_task').initTaskForm()
  $('#new_task').bind 'empty', ->
    $(@).find('input[type=text]').val('')
    $('#new_task .priorities .btn').removeClass('active')

  $('.tasks').on 'click', '.task .complete-task input', ->
    $(@).parents('form').submit()

  $('.modal.edit-task').live 'shown', ->
    $(@).find('.submit').bind 'click', ->
      $(@).parents('.modal').find('form').submit()
      true
    $(@).find('form').initTaskForm()