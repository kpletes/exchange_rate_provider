# frozen_string_literal: true

require './lib/custom_errors/base'

class ExchangeRateParser
  DATA_START_ROW = 2
  COLUMN_SEPARATOR = '|'
  COLUMN_NAMES = %i[country currency amount code rate].freeze

  def initialize(data)
    raise CustomError::DataParserError, 'Data must be a string' unless data.is_a?(String)

    @data = data
  end

  def parse_rates
    raise CustomError::DataParserError, 'Data cannot be empty' if @data.empty?

    begin
      parse_data(@data)
    rescue StandardError => e
      raise CustomError::DataParserError, e.message
    end
  end

  private

  # Parses exchange rate data from a string and returns an array of hashes
  def parse_data(data)
    lines = data.lines.map(&:strip)
    lines[DATA_START_ROW..].map do |line|
      values = line.split(COLUMN_SEPARATOR)
      COLUMN_NAMES.zip(values).to_h
    end
  end
end
