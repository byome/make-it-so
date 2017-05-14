require 'rubygems'
require 'mechanize'
require 'pry'

require "make_it_so/constants/oxide_mod"
require "make_it_so/plugin_parser"

module MakeItSo
  class Plugins
    include Constants::OxideMod
    include PluginParser

    def initialize(plugin_path)
      @plugin_urls = []
      @plugin_path = plugin_path
    end

    def get_plugins_urls
      actor.get(Constants::OxideMod.oxide_login_page) do |login_page|
        oxidemod = login_page.form_with(id: 'pageLogin') do |login|
          login.login = ENV["OXIDE_EMAIL"]
          login.password = ENV["OXIDE_PASSWORD"]
        end.submit

        Constants::OxideMod.mods.each do |mod_url|
          @plugin_urls << actor.get(mod_url).at(".downloadButton > a").attributes["href"].value
        end
      end
    end

    def download_plugins!
      @plugin_urls.each do |plugin_url|
        actor.get(plugin_url).save!("#{plugin_path}/#{filename}")
      end
    end


    private

    def actor
      @actor ||= Mechanize.new do |agent|
        agent.user_agent_alias = 'Mac Safari',
        agent.pluggable_parser.cs = PluginParser
      end
    end
  end
end
