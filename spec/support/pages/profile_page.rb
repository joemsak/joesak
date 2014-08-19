class ProfilePage < PageBase
  attr_reader :username

  def initialize(username)
    @username = username
  end

  def visit
    super(url)
  end

  def has_gist?(title)
    has_css?('#profile .gist', text: title)
  end

  private
  def url
    profile_path(username)
  end
end
