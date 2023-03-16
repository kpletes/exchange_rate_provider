#!/usr/bin/env ruby
# frozen_string_literal: true

require './lib/exchange_rate_fetcher'

if __FILE__ == $PROGRAM_NAME
  begin
    date = ARGV.first
    exchange_rate_fetcher = ExchangeRateFetcher.new(date)
    exchange_rates = exchange_rate_fetcher.fetch
    puts exchange_rates
  rescue StandardError => e
    warn "Error fetching exchange rates: #{e.message}"
    exit 1
  end
end
