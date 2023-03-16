require 'spec_helper'
require 'webmock/rspec'
require './lib/exchange_rate_provider'

RSpec.describe ExchangeRateProvider do
  describe '#provide_data' do
    let(:url) { 'https://example.com' }
    let(:provider) { ExchangeRateProvider.new(url) }

    context 'when the request is successful' do
      let(:response_body) { 'Response body' }

      before do
        stub_request(:get, url).to_return(status: 200, body: response_body)
      end

      it 'returns the response body' do
        expect(provider.provide_data).to eq(response_body)
      end
    end

    context 'when the request is unsuccessful' do
      before do
        stub_request(:get, url).to_return(status: 404)
      end

      it 'raises a data provider error' do
        expect { provider.provide_data }.to raise_error(CustomError::DataFetcherError)
      end
    end

    context 'when the URL is invalid' do
      let(:url) { 'invalid url' }

      it 'raises an invalid URL error' do
        expect { provider.provide_data }.to raise_error(CustomError::InvalidUrlError)
      end
    end

    context 'when there is a connection error' do
      before do
        stub_request(:get, url).to_raise(Errno::ECONNREFUSED)
      end

      it 'raises a data fetcher error' do
        expect { provider.provide_data }.to raise_error(CustomError::DataFetcherError)
      end
    end
  end
end
