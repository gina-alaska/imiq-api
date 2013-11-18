module WelcomeHelper
  def show_api_list
    content = content_tag(:ul) do
      %w{ site }.collect { |name|
         content_tag(:li, name.humanize)
      }.join('').html_safe
    end
    
    content
  end
end
