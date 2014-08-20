module ApplicationHelper
  def sign_up_link
    unless current_profile
      link_to t('application.sign_up'), sign_up_path
    end
  end

  def sign_in_link
    unless current_profile
      link_to t('application.sign_in'), sign_in_path
    end
  end

  def sign_out_link
    if current_profile
      link_to t('application.sign_out'), sign_out_path
    end
  end

  def your_profile_link
    if current_profile
      link_to current_profile.name, root_profile_path
    end
  end
end
