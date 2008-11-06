require File.dirname(__FILE__) + "/test_helper"
class JrailsUjsHelperTest < ActiveSupport::TestCase
  def test_ujs_link_to_creates_normal_links_with_class_name_ujs
    tag = ujs_link_to("New Item", "/item/new")
    assert_tag_in tag, :a, :attributes => {:href => "/item/new", :class => "ujs"}
  end
  
  def test_ujs_link_to_handles_html_options
    tag = ujs_link_to("New Item", "/item/new", :id => "new_item_link")
    assert_tag_in tag, :a, :attributes => {
        :href => "/item/new", 
        :class => "ujs", 
        :id => "new_item_link"
      }
  end
end
