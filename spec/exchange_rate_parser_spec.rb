require 'spec_helper'
require './lib/exchange_rate_parser'

RSpec.describe ExchangeRateParser do
  describe '#parse_rates' do
    context 'with valid data' do
      let(:data) do
        '15 Mar 2023 #53
         Country|Currency|Amount|Code|Rate
         Australia|dollar|1|AUD|15
         Croatia|kuna|1|KN|0.75'
      end

      subject(:parser) { described_class.new(data) }

      it 'parses the exchange rate data into an array of hashes' do
        expected_output = [
          { country: 'Australia', currency: 'dollar', amount: '1', code: 'AUD', rate: '15' },
          { country: 'Croatia', currency: 'kuna', amount: '1', code: 'KN', rate: '0.75' }
        ]

        expect(parser.parse_rates).to eq(expected_output)
      end
    end

    context 'with empty data' do
      let(:data) { '' }

      subject(:parser) { described_class.new(data) }

      it 'raises a data parser error if data is empty' do
        expect do
          parser.parse_rates
        end.to raise_error(CustomError::DataParserError, 'Error parsing data: Data cannot be empty')
      end
    end

    context 'with invalid data' do
      let(:data) { nil }

      subject(:parser) { described_class.new(data) }

      it 'raises a DataParserError' do
        expect do
          parser.parse_rates
        end.to raise_error(CustomError::DataParserError, 'Error parsing data: Data must be a string')
      end
    end
  end
end
