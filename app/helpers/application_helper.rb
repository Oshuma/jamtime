# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def link_with_active(name, path)
    opts = { :class => 'active' } if current_page?(path)
    content_tag :li, opts do
      link_to(name, path)
    end
  end

  def messages_waiting?
    flash[:notice] || flash[:error]
  end

  def error_message
    return unless flash[:error]
    message_content(:error)
  end

  def notice_message
    return unless flash[:notice]
    message_content(:notice)
  end

  private

  def message_content(type)
    opts = { :id => "#{type.to_s}-message", :class => 'message' }
    content_tag(:div, opts) { flash[type] }
  end

end
