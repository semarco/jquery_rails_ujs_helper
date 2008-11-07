# JrailsUjsHelper
module JrailsUjsHelper
  include ActionController::PolymorphicRoutes
  include ActionView::Helpers::FormHelper
  include ActionView::Helpers::RecordIdentificationHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper
  
  def ujs_link_to(name, options = {}, html_options = nil)
    if html_options
      then html_options = html_options.merge(ujs_class)
      else html_options = ujs_class
    end
    
    link_to(name, options, html_options)
  end
  
  def ujs_form_for(record_or_name_or_array, *args, &proc)
    args.each_with_index do |a, index|
      next unless a.is_a?(Hash) && a.has_key?(:html)
      args[index] = {:html => a[:html].merge!(ujs_class)}
    end
    
    form_for(record_or_name_or_array, args.pop, &proc)
  end
  
  private
  def ujs_class
    @ujs_class ||= {:class => "ujs"}
  end
end
