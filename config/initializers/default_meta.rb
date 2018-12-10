# Let's create a default_meta.rb file in config/initializers
# in which we load the content as a Hash in a DEFAULT_META Ruby constant.
DEFAULT_META = YAML.load_file(Rails.root.join("config/meta.yml"))

# Important: as any file in the config/initializers folder, it is loaded when your app is launched.
# Any time you change the content in meta.yml, restart your rails s to refresh DEFAULT_META!
