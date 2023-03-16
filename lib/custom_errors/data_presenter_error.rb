# frozen_string_literal: true

module CustomError
  class DataPresenterError < StandardError
    def initialize(message)
      super("Error presenting data: #{message}")
    end
  end
end
