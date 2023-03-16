# frozen_string_literal: true

module CustomError
  class DataParserError < StandardError
    def initialize(message)
      super("Error parsing data: #{message}")
    end
  end
end
