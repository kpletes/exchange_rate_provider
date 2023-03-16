# frozen_string_literal: true

require './lib/exchange_rate_provider'
require './lib/exchange_rate_parser'
require './lib/exchange_rate_presenter'

class ExchangeRateFetcher
  DAILY_RATES_URL = 'https://www.cnb.cz/en/financial-markets/foreign-exchange-market/central-bank-exchange-rate-fixing/central-bank-exchange-rate-fixing/daily.txt'

  def initialize(date = nil)
    @date = date
  end

  def fetch
    url = build_url
    data = provide_data(url)
    parsed_data = parse_data(data)
    format_rates(parsed_data)
  end

  def build_url
    url = DAILY_RATES_URL
    url += "?date=#{@date}" if @date
    url
  end

  def provide_data(url)
    data_fetcher = ExchangeRateProvider.new(url)
    data_fetcher.provide_data
  end

  def parse_data(data)
    data_parser = ExchangeRateParser.new(data)
    data_parser.parse_rates
  end

  def format_rates(data)
    data_presenter = ExchangeRatePresenter.new(data)
    data_presenter.format_output
  end
end
