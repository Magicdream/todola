# return the html tag unmodified and unwrapped
# we use custom error rendering
ActionView::Base.field_error_proc = Proc.new do |html_tag, object|
  html_tag
end