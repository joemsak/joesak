module ApplicationHelper
  def sign_up_link(tag = nil)
    unless current_profile
      link = link_to t('application.sign_up'), sign_up_path
      css = active_if_matches(sign_up_path)
      tag ? content_tag(tag, link, class: css) : link
    end
  end

  def sign_in_link(tag = nil)
    unless current_profile
      link = link_to t('application.sign_in'), sign_in_path
      css = active_if_matches(sign_in_path)
      tag ? content_tag(tag, link, class: css) : link
    end
  end

  def sign_out_link(tag = nil)
    if current_profile
      link = link_to t('application.sign_out'), sign_out_path
      tag ? content_tag(tag, link) : link
    end
  end

  def your_profile_link(tag = nil)
    if current_profile
      link = link_to current_profile.name, root_profile_path
      css = active_if_matches(root_profile_path)
      tag ? content_tag(tag, link, class: css) : link
    end
  end

  private
  def active_if_matches(path)
    'active' if current_page?(path)
  end
end
