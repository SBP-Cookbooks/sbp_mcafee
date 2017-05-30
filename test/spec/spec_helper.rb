require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.extend(ChefSpec::Cacher)

  config.platform = 'windows'       # Set OS type
  config.version = '2012R2'         # Set OS version

  config.color = true               # Use color in STDOUT
  config.formatter = :documentation # Use the specified formatter
  # config.log_level = :error         # Avoid deprecation notice SPAM
end
