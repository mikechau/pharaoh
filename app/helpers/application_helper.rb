module ApplicationHelper
  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-danger alert-dismissible" role="alert">
      <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def alert_class_for(flash_type)
    {
      :success => 'alert-success',
      :alert => 'alert-danger',
      :warn => 'alert-warning',
      :notice => 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def check_for_admin(current_user)
    return true if current_user.try(:is_admin?)
  end
end
