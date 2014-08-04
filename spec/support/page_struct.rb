class PageStruct < Struct
  include Capybara::DSL
  include ActionView::Helpers
  include Rails.application.routes.url_helpers

  def open
    save_and_open_page
  end

  private
  def error_introduction
    t("activerecord.errors.introduction", name: model_name)
  end
end
