module AsHelper
  def method_missing(name, *args)
    if match = name.to_s.match(/^as_(.+)$/)
      developer = create(match[1].to_s, username: 'developer')
      yield(developer)
    else
      super
    end
  end
end
