# frozen_string_literal: true

module CustomError
  class InvalidUrlError < StandardError
    def initialize(url)
      super("Invalid URL: #{url}")
    end
  end
end
