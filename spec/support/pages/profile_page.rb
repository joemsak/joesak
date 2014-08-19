class ProfilePage < PageBase
  attr_reader :username

  def initialize(username)
    @username = username
  end

  def visit
    super(url)
  end

  def no_information
    t('profiles.no_information', name: profile.name)
  end

  def has_gist?(title)
    has_css?('#profile .gist', text: title)
  end

  private
  def url
    profile_path(username)
  end

  def profile
    @profile ||= Profile.find_by(username: username)
  end
end
