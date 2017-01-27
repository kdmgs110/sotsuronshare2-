CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAJOPCBLNAGL7IXTWA',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
  }

  case Rails.env
    when 'production'
      config.fog_directory = 'sotsuronshare'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/sotsuronshare'

    when 'development'
      config.fog_directory = 'sotsuronshare'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/sotsuronshare'

    when 'test'
      config.fog_directory = 'sotsuronshare'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/sotsuronshare'
  end
end
