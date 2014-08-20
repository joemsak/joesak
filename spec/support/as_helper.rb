module AsHelper
  def method_missing(name, *args)
    if match = name.to_s.match(/^as_(.+)$/)
      user_type = match[1]
      user = create(user_type.to_sym, username: user_type)
      page = LoginPage.new
      page.visit
      page.fill_in_form(user)
      page.submit_form
      yield(user)
    else
      super
    end
  end
end
