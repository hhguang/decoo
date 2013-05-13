module ApplicationHelper
  def notice_message
      flash_messages = []

      flash.each do |type, message|
        type = :success if type == :notice
        text = content_tag(:div, link_to("x", "#", :class => "close") + content_tag(:p,message), :class => "alert alert-#{type}", "data-alert" => "alert")
        flash_messages << text if message
      end

      flash_messages.join("\n").html_safe
    end

  def controller_javascript_include_tag
    javascript_include_tag controller_name
#    case controller_name
#    when "pages","topics","sites", "notifications", "notes"
#      javascript_include_tag controller_name
#    when "replies"
#      javascript_include_tag "topics"
#    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    #link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end

end
