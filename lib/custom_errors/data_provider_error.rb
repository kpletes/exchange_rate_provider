# frozen_string_literal: true

module CustomError
  class DataProviderError < StandardError
    def initialize(response)
      super("Failed to provide data (#{response.code}): #{response.body}")
    end
  end
end
