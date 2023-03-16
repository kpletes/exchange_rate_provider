require 'spec_helper'
require './lib/exchange_rate_fetcher'

RSpec.describe ExchangeRateFetcher do
  subject(:fetcher) { described_class.new(date) }

  let(:date) { nil }
  let(:url) { ExchangeRateFetcher::DAILY_RATES_URL }

  describe '#build_url' do
    subject(:build_url) { fetcher.build_url }

    context 'without a date' do
      it 'returns the daily rates url' do
        expect(build_url).to eq(url)
      end
    end

    context 'with a date' do
      let(:date) { '2022-01-01' }

      it 'returns the daily rates url with the date' do
        expect(build_url).to eq("#{url}?date=#{date}")
      end
    end
  end
end
