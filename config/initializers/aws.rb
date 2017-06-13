CarrierWave.configure do |config|
                          # required
  config.fog_provider = 'fog/aws'  
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAIHCVU66DW2C5HWUA',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'
         # optional, defaults to nil
    endpoint:              'https://s3.ap-northeast-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'jejudatabase'                          # required
  config.fog_public     = true                                        # optional, defaults to true
  config.fog_attributes = {} # optional, defaults to {}
end