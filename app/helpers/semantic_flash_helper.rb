module SemanticFlashHelper
  ALERT_TYPES = [:error, :info, :success, :warning]

  def semantic_flash
    output = ''
    flash.each do |type, message|
      next if message.blank?
      type = :success if type.to_sym == :notice
      type = :error   if type.to_sym == :alert
      next unless ALERT_TYPES.include?(type.to_sym)
      output += flash_container(type, message)
    end

    raw(output)
  end

  def flash_container(type, message)
    content_tag(:div, class: "ui #{type} message") do
      content_tag(:i, '', class: "close icon") + message
    end
  end
end
