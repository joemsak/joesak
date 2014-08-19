class PageStruct < Struct
  include Capybara::DSL
  include ActionView::Helpers
  include Rails.application.routes.url_helpers

  def open
    save_and_open_page
  end

  def not_found_title
    t('page_not_found.title')
  end

  def not_found_content
    t('page_not_found.content')
  end

  private
  def error_introduction
    t("activerecord.errors.introduction", name: model_name)
  end
end

class PageBase < PageStruct.new(:noop)
end
