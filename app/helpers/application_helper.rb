module ApplicationHelper
  
  def body_id
    "#{controller_name}-#{action_name}"
  end
  
  def body_classes
    classes = []
    classes << controller.controller_name
    classes.join(' ')
  end
  
end
