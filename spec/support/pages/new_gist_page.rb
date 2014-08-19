class NewGistPage < FormPageStruct
  def visit
    super(new_gist_path)
  end

  def fill_in_remote_finder(input)
    fill_in(:gist_remote_id, with: input)
  end

  def success_path
    profiles_root_path
  end

  private
  def model_name
    'Gist'
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
