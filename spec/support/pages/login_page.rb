class LoginPage < FormPageStruct
  def visit
    super(sign_in_path)
  end

  def fill_in_form(profile)
    fill_in :username, with: profile.username
    fill_in :password, with: profile.password
  end

  def success_path
    root_profile_path
  end

  private
  def button_name
    t('forms.buttons.sessions.sign_in')
  end
end
