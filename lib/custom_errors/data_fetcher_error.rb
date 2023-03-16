# frozen_string_literal: true

module CustomError
  class DataFetcherError < StandardError
    def initialize(message)
      super("Error fetching data: #{message}")
    end
  end
end
