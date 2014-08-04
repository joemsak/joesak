class FormPageStruct < PageStruct.new(:noop)
  def submit_form
    click_button('Save')
  end

  def has_validation_error?(name, type)
    error_msg = error_message(name, type)
    has_content?(error_introduction)
    has_content?(error_msg)
  end

  private
  def error_message(name, key)
    attribute = attribute_name(name)
    t("activerecord.errors.models.#{model_name.underscore}.attributes.#{attribute}.#{key}")
  end
end
