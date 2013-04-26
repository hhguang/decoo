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

end
