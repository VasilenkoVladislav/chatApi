require 'aws-sdk'

stub = Rails.env == 'test' ? true : false

Aws.config.update(
  credentials: Aws::Credentials.new(ENV['AWS_API_ACCESS_KEY_ID'], ENV['AWS_API_SECRET_ACCESS_KEY']),
  region: 'eu-central-1',
  stub_responses: stub
)