require 'spec_helper'

describe Ibanizator::Iban do
  let(:an_iban_string) { "de68 2105 0170 0012 3456 78" }
  let(:sanitized_iban_string) { "DE68210501700012345678" }
  let(:iban) { Ibanizator::Iban.new(an_iban_string) }

  describe '#initialze' do
    it 'takes the iban string as argument' do
      expect(Ibanizator::Iban.new(an_iban_string).to_s).to eq(sanitized_iban_string)
    end
  end

  describe '#country_code' do
    it 'returns the country code of the given iban as symbol' do
      expect(iban.country_code).to eq(:DE)
    end

    it 'returns :unkown_country if the ibanizator does not recognize the country code' do
      expect(Ibanizator::Iban.new("XX1234678901234567").country_code).to eq(:unknown)
    end
  end

  describe '#extended_data' do
    context 'given a german iban' do
      it 'returs an Instance of Ibanizator::Iban::ExendedData::DE' do
        expect(iban.extended_data).to be_a(Ibanizator::Iban::ExtendedData::DE)
      end

      it 'delegates the object construction to Ibanizator::Iban::ExendedData::DE.with_iban(an_iban)' do
        expect(Ibanizator::Iban::ExtendedData::DE).to receive(:new).with(iban)

        iban.extended_data
      end
    end
  end

  describe '#valid?' do
    let(:validator) { double('validator').as_null_object }

    it 'delegates the validation to Ibanizator::Iban::Validator#validate' do
      expect(Ibanizator::Iban::Validator).to receive(:new).with(iban).and_return(validator)

      iban.valid?
    end

    it 'returns the validation result' do
      allow(Ibanizator::Iban::Validator).to receive(:new).and_return(validator)
      allow(validator).to receive(:validate).and_return('THE VALIDATION RESULT')

      expect(iban.valid?).to eq('THE VALIDATION RESULT')
    end
  end

  describe '#formatted_iban_string' do
    it 'returns the country code of the given iban as symbol' do
      expect(iban.formatted_iban_string).to eq('DE68 2105 0170 0012 3456 78')
    end
  end

  describe '.from_string' do
    it 'delegates the object creation to new' do
      expect(Ibanizator::Iban).to receive(:new).with('an_iban')

      Ibanizator::Iban.from_string('an_iban')
    end

    it 'returns an Ibanizator::Iban' do
      expect(Ibanizator::Iban.from_string('a_string')).to be_a(Ibanizator::Iban)
    end
  end

  it 'defines equality based on the sanitized iban string' do
    expect(Ibanizator::Iban.new(an_iban_string)).to eq(Ibanizator::Iban.new(an_iban_string))
  end

  it 'makes the iban immutable' do
    expect {
      Ibanizator::Iban.new(an_iban_string).iban_string.downcase!
    }.to raise_error
  end
end
