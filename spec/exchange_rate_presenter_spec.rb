require 'spec_helper'
require './lib/exchange_rate_presenter'

RSpec.describe ExchangeRatePresenter do
  describe '#format_output' do
    subject(:presenter) { described_class.new(exchange_rates) }

    let(:exchange_rates) do
      [
        { country: 'USA', amount: 1, currency: 'USD', code: 'USD', rate: 1.0 },
        { country: 'Japan', amount: 100, currency: 'JPY', code: 'JPY', rate: 0.0093 }
      ]
    end

    context 'with valid exchange rates' do
      it 'returns formatted exchange rates' do
        expected_output = "USA 1 USD (USD): 1.0\nJapan 100 JPY (JPY): 0.0093"
        expect(presenter.format_output).to eq(expected_output)
      end
    end

    context 'when exchange_rates is nil' do
      let(:exchange_rates) { nil }

      it 'raises a DataPresenterError' do
        expect { presenter.format_output }
          .to raise_error(CustomError::DataPresenterError,
                          'Error presenting data: Exchange rates are missing or empty.')
      end
    end

    context 'when exchange_rates is empty' do
      let(:exchange_rates) { [] }

      it 'raises a DataPresenterError' do
        expect { presenter.format_output }
          .to raise_error(CustomError::DataPresenterError,
                          'Error presenting data: Exchange rates are missing or empty.')
      end
    end
  end
end
