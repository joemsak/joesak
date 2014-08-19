class LoginPage < FormPageStruct
  def visit
    super(new_session_path)
  end

  def fill_in_form(developer)
    fill_in :username, with: developer.username
    fill_in :password, with: developer.password
  end

  def success_path
    profiles_root_path
  end

  private
  def button_name
    t('forms.buttons.sessions.sign_in')
  end
end
