# frozen_string_literal: true

require 'net/https'
require 'uri'
require './lib/custom_errors/base'

class ExchangeRateProvider
  def initialize(url)
    @url = url
    validate_url!
  end

  # Provides exchange rate data from a url
  def provide_data
    uri = URI.parse(@url)

    response = nil
    Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https', open_timeout: 5, read_timeout: 10) do |http|
      request = Net::HTTP::Get.new(uri)
      response = http.request(request)
    end

    raise CustomError::DataProviderError, response unless response.is_a?(Net::HTTPSuccess)

    response.body
  rescue StandardError => e
    raise CustomError::DataFetcherError, e.message
  end

  private

  def validate_url!
    uri = URI.parse(@url)
    raise CustomError::InvalidUrlError, @url unless uri.scheme && uri.host
  rescue URI::InvalidURIError
    raise CustomError::InvalidUrlError, @url
  end
end
