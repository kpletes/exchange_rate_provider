# frozen_string_literal: true

require 'date'

class ExchangeRateDateValidator
  def self.validate(date)
    return nil unless date

    begin
      Date.parse(date)
    rescue ArgumentError
      raise ArgumentError, 'Invalid date format'
    end
  end
end
