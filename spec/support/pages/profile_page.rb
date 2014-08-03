class ProfilePage < PageBase.new(:username)
  def visit(url = profile_path(username))
    super(url)
  end

  def has_gist?(title)
    has_css?('#profile .gist', text: title)
  end
end
