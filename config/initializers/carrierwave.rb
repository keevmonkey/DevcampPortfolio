CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['DO_ACCESS_KEY_ID'],
    :aws_secret_access_key  => ENV['DO_SECRET_ACCESS_KEY'],
    :region                 => ENV['DO_REGION'],
    :endpoint               => 'https://sgp1.digitaloceanspaces.com'
  }
  config.fog_directory  = ENV['DO_BUCKET']
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  config.fog_public = false
  config.asset_host = "https://sgp1.digitaloceanspaces.com"
  config.fog_attributes = { 'Cache-Control' => 'max-age=315576000' }
end