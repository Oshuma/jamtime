AppConfig.setup do |config|
  config[:env] = Rails.env
  config[:uri] = "yaml://#{Rails.root}/config/app_config.yml"
end
