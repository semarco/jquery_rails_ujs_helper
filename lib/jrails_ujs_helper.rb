# JrailsUjsHelper
module JrailsUjsHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper
  
  def ujs_link_to(name, options = {}, html_options = nil)
    ujs_class = {:class => "ujs"}
    
    if html_options
      then html_options = html_options.merge(ujs_class)
      else html_options = ujs_class
    end
    
    link_to(name, options, html_options)
  end
end
