# frozen_string_literal: true

require './lib/custom_errors/base'

class ExchangeRatePresenter
  attr_reader :exchange_rates

  def initialize(exchange_rates)
    if exchange_rates.nil? || exchange_rates.empty?
      raise CustomError::DataPresenterError, 'Exchange rates are missing or empty.'
    end

    @exchange_rates = exchange_rates
  end

  # Formates exchange rate data for more readability
  def format_output
    exchange_rates.map do |rate|
      "#{rate[:country]} #{rate[:amount]} #{rate[:currency]} (#{rate[:code]}): #{rate[:rate]}"
    end.join("\n")
  rescue StandardError => e
    raise CustomError::DataPresenterError, e.message
  end
end
