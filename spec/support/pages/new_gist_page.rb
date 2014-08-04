class NewGistPage < FormPageStruct
  def visit
    super(new_gist_path)
  end

  def fill_in_remote_finder(input)
    fill_in(:gist_remote_id, with: input)
  end

  def submit_form
    click_button('Save')
  end

  def has_validation_error?(name, type)
    error_msg = error_message(name, type)
    has_content?(error_introduction)
    has_content?(error_msg)
  end

  private
  def model_name
    'Gist'
  end

  def error_message(name, key)
    attribute = attribute_name(name)
    t("activerecord.errors.models.gist.attributes.#{attribute}.#{key}")
  end

  def attribute_name(attr)
    case attr
    when :remote_finder
      :remote_id
    else
      attr
    end
  end
end
