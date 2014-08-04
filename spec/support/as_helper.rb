module AsHelper
  def method_missing(name, *args)
    if match = name.to_s.match(/^as_(.+)$/)
      type = match[1]
      user = create(type.to_sym, username: type)
      yield(user)
    else
      super
    end
  end
end
