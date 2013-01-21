$ ->
  $('.tasks-list').on 'click', '.task .complete-task input', ->
    $(@).parents('form').submit()
