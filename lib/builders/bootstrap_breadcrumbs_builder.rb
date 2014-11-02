# bootstrap builder for breadcrumbs_on_rails gem
class BootstrapBreadcrumbsBuilder < BreadcrumbsOnRails::Breadcrumbs::Builder
  NoBreadcrumbsPassed = Class.new(StandardError)

  def render
    regular_elements = @elements.dup
    active_element = regular_elements.pop || raise(NoBreadcrumbsPassed)
 
    @context.content_tag(:ol, class: 'breadcrumb') do
      regular_elements.collect do |element|
        render_regular_element(element)
      end.join.html_safe + render_active_element(active_element).html_safe
    end
  end

  def render_regular_element(element)
    @context.content_tag :li do
      @context.link_to(compute_name(element), compute_path(element), element.options)
    end
  end
 
  def render_active_element(element)
    @context.content_tag :li, class: 'active' do
      compute_name(element)
    end
  end
end

# Usage:
# = render_breadcrumbs(builder: BootstrapBreadcrumbsBuilder)