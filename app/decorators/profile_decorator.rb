class ProfileDecorator < Draper::Decorator
  delegate_all

  def information
    if has_page_content?
      'content'
    else
      'empty'
    end
  end

  private
  def has_page_content?
    !summary.blank?
  end
end
