class YourProfilePage < PageStruct.new(:noop)
  def visit
    super(root_developer_path)
  end
end
