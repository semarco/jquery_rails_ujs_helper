require 'test/unit'
require 'rubygems'
require 'active_support'
require 'active_support/test_case'
require 'action_controller'
require 'action_view'
require 'html/document'

require File.dirname(__FILE__) + "/../lib/jrails_ujs_helper"
include JrailsUjsHelper

def assert_tag_in(*opts)  
   target = HTML::Document.new(opts.shift, false, false)  
   opts = opts.size > 1 ? opts.last.merge({ :tag => opts.first.to_s }) : opts.first  
   assert !target.find(opts).nil?,   
     "expected tag, but no tag found matching #{opts.inspect} in:\n#{target.inspect}"  
end