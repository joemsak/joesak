class ProfileDecorator < Draper::Decorator
  delegate_all

  def display_summary
    if blank_page_fields?
      "#{name} does not have any information."
    else
      summary
    end
  end

  private
  def blank_page_fields?
    summary.blank?
  end
end
