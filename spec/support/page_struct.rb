class PageStruct < Struct
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def open
    save_and_open_page
  end
end
