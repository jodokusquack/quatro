module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Quarto'
    if page_title.blank?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def default_username(user)
    user.email.split('@')[0].capitalize
  end
end
