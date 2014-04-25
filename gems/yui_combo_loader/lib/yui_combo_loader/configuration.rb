require 'singleton'

module YuiComboLoader

  class Configuration
    include Singleton
    
    attr_accessor :combo_path
    attr_accessor :public_root
    attr_accessor :public_base

    def initialize
      @combo_path = "/yui"
      @public_root = File.dirname(__FILE__)
      @public_base = "/javascripts/"
    end
  end

end