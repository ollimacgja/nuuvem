module ApplicationHelper
  def login_helper
    if current_user
      "#{I18n.t('site.logged_as')} #{current_user.email} #{link_to t('devise.log_out'), destroy_user_session_path, method: :delete}".html_safe
    else
      link_to t('devise.log_in'), new_user_session_path
    end
  end

  def boolean_helper(bool)
    if bool
      content_tag(:i, nil, class: 'fa fa-check-circle green')
    else
      content_tag(:i, nil, class: 'fa fa-times-circle red')
    end
  end
end
