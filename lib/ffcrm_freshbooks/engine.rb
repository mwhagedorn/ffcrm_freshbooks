require "ffcrm_freshbooks"
require "rails"

module FfcrmFreshbooks
  class Engine < Rails::Engine
    #TODO make engine load first if not already
    config.after_initialize do
           directory = File.expand_path(File.dirname(__FILE__))
           require File.join(directory,'callback_hooks')
    end
  end
end