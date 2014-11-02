module ControllerHelper
  def controller_class
    controller_path.gsub('/', '_')
  end

  def controller_model
    controller.
      class.
        to_s.
        gsub('Controller', '').
        singularize
  end

  def controller_resource_name
    controller_name.titleize
  end

  def current_url
    request.original_url
  end
end