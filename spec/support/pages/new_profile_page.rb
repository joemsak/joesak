class NewProfilePage < FormPageStruct
  def visit
    super(new_profile_path)
  end

  def fill_in_form(username, password)
    fill_in :profile_username, with: username
    fill_in :profile_password, with: password
    fill_in :profile_password_confirmation, with: password
  end

  private
  def button_name
    t('forms.buttons.profiles.sign_up')
  end
end
