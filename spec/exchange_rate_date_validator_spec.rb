require 'spec_helper'
require './lib/exchange_rate_date_validator'

RSpec.describe ExchangeRateDateValidator do
  describe '.validate' do
    subject(:validate_date) { described_class.validate(date) }

    context 'when given a valid date' do
      let(:date) { '2022-01-01' }

      it { is_expected.to be_an_instance_of(Date) }
    end

    context 'when given an invalid date' do
      let(:date) { 'string' }

      it 'raises an ArgumentError with a specific message' do
        expect { validate_date }.to raise_error(ArgumentError, 'Invalid date format')
      end
    end

    context 'when given a nil date' do
      let(:date) { nil }

      it { is_expected.to be_nil }
    end
  end
end
