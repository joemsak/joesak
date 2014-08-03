class ProfileDecorator < Draper::Decorator
  delegate_all
  decorates_association :gists

  def information
    if has_page_content?
      'content'
    else
      'empty'
    end
  end

  private
  def has_page_content?
    !summary.blank? || gists.any?
  end
end
