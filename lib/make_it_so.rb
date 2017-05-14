require 'dotenv/load'

require 'make_it_so/plugins'

module MakeItSo
  class << self
    MakeItSo::Plugins.get_plugins
  end
end
