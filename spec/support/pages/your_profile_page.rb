class YourProfilePage < PageBase
  def visit
    super(root_profile_path)
  end
end
