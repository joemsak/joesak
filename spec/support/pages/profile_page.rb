class ProfilePage < PageBase.new(:username)
  def visit(url = profile_path(username))
    super(url)
  end
end
