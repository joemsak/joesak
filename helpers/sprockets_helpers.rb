module SprocketsHelpers
  def self.included(base)
    base.set :root, File.expand_path('../../', __FILE__)
    base.set :sprockets, Sprockets::Environment.new(base.root)
    base.set :precompile, [ /\w+\.(?!js|css).+/, /application.(css|js)$/ ]
    base.set :assets_prefix, 'assets'
    base.set :assets_path, File.join(base.root, 'public', base.assets_prefix)

    base.configure do
      base.sprockets.append_path(File.join(base.root, 'assets', 'stylesheets'))
      base.sprockets.append_path(File.join(base.root, 'assets', 'javascripts'))
      base.sprockets.append_path(File.join(base.root, 'assets', 'images'))

      base.sprockets.context_class.instance_eval do
        include AssetHelpers
      end
    end
  end
end
