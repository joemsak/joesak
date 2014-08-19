class YourProfilePage < PageBase
  def visit
    super(root_developer_path)
  end
end
