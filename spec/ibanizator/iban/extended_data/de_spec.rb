require 'spec_helper'

describe Ibanizator::Iban::ExtendedData::DE do
  let(:iban) { Ibanizator::Iban.new("DE68210501700012345678") }
  let(:extended_data) { Ibanizator::Iban::ExtendedData::DE.new(iban) }

  describe('#initialize') do
    it 'takes an iban as argument' do
      expect(Ibanizator::Iban::ExtendedData::DE.new(iban).iban).to eq(iban)
    end

    it 'raises an Ibanizator::Iban::Invalid error if the given iban is not valid' do
      iban = double('iban', valid?: false)

      expect {
        Ibanizator::Iban::ExtendedData::DE.new(iban)
      }.to raise_error(Ibanizator::Iban::Invalid)
    end
  end

  describe '#bank_code' do
    it 'returns the bank code that is encoded in the iban' do
      expect(extended_data.bank_code).to eq('21050170')
    end
  end

  describe '#account_number' do
    it 'returns the account number that is encoded in the iban withou leading zeros' do
      expect(extended_data.account_number).to eq('12345678')
    end
  end

  describe '#bic' do
    it 'returns the BIC that correlates to the encoded bank code' do
      expect(extended_data.bic).to eq('NOLADE21KIE')
    end
  end

  describe '#bank_name' do
    it 'returns the BIC that correlates to the encoded bank code' do
      expect(extended_data.bank_name).to eq('Förde Sparkasse')
    end
  end

  describe '#to_hash' do
    it 'returns the the data as a hash' do
      data = {
        bank_code: '21050170',
        account_number: '12345678',
        bic: 'NOLADE21KIE',
        bank_name: 'Förde Sparkasse',
      }
      expect(extended_data.to_hash).to eq(data)
      expect(extended_data.to_hash).to eq(extended_data.to_h)
    end
  end

  it 'defines the equality base on the iban' do
    extended_data2 = Ibanizator::Iban::ExtendedData::DE.new(iban)

    expect(extended_data).to eq(extended_data2)
  end

  it 'makes the object immutable' do
    expect {
      Ibanizator::Iban::ExtendedData::DE.new(iban).instance_variable_set(:@iban, nil)
    }.to raise_error
  end
end
