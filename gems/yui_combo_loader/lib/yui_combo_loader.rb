
module YuiComboLoader

  autoload :Configuration, 'yui_combo_loader/configuration'
  autoload :Middleware, 'yui_combo_loader/middleware'


  # Accessor to the global configuration
  # @return [Configuration]
  def self.configuration
    Configuration.instance
  end

  # Allows to configure the combo loader via a block
  #
  # Example use : 
  # 
  #   YuiComboLoader.configure do |config|
  #     config.base_path = '/yui'
  #   end
  def self.configure
    yield configuration
  end


end