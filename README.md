# ibanizator [![Tests](https://github.com/softwareinmotion/ibanizator/actions/workflows/ruby.yml/badge.svg)](https://github.com/softwareinmotion/ibanizator/actions/workflows/ruby.yml)

ibanizator calculates the iban for german accounts. The database that is used to convert a bank number to a
BIC is taken from [Deutsche Bundesbank](https://www.bundesbank.de/en/tasks/payment-systems/services/bank-sort-codes/download-bank-sort-codes-626218).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ibanizator'
```

## Usage

### Calculate IBAN

To calculate the iban for some german accounts, just use this method:

```ruby
ibanizator = Ibanizator.new
ibanizator.calculate_iban country_code: :de, bank_code: '12345678', account_number: '123456789'
```

In the current version the ibanizator gem only works for german accounts.

### Validate an IBAN

To validate the iban you need to check the length and after this check the checksum. For details please refer to
the documentation online (e.g. [Wikipedia](http://es.wikipedia.org/wiki/IBAN)).

This gem provides a simple validator for several contries. All countries that are listed in the Ibanizator::Iban::LENGTHS hash are supported at the moment.

```ruby
iban = Ibanizator.iban_from_string("DE68 2105 0170 0012 3456 78")
iban.valid? # => true
```

### Information provided by an IBAN

The Ibanizator::Iban class provides some handy utility methods to query
information about an iban.

```ruby
iban = Ibanizator.iban_from_string("DE68 2105 0170 0012 3456 78")
iban.country_code # => :DE

# there is extended data for german ibans
iban.extended_data.bank_code        # => "21050170"
iban.extended_data.account_number   # => "12345678"
iban.extended_data.bic              # => "NOLADE21KIE"
```

### Find bank infos

If you need to get a bank name, bank code or a bic from a german bank and you
have either a BIC or a bank code there is a bank db.

```ruby
# find a bank by BIC
bank_1 = Ibanizator.bank_db.bank_by_bic('MARKDEF1100')
bank_1.name       # => 'BBk Berlin'
bank_1.bic        # => 'MARKDEF1100'
bank_1.bank_code  # => '10000000'

# find a bank by bank_code (de: Bankleitzahl)
bank_2 = Ibanizator.bank_db.bank_by_bank_code('100 000 00')
bank_2.name       # => 'BBk Berlin'
bank_2.bic        # => 'MARKDEF1100'
bank_2.bank_code  # => '10000000'

bank_3 = Ibanizator.bank_db.bank_by_bank_code('10000000')
bank_3.name       # => 'BBk Berlin'
bank_3.bic        # => 'MARKDEF1100'
bank_3.bank_code  # => '10000000'

bank_1 == bank_2  # => true
bank_2 == bank_3  # => true

bank_4 = Ibanizator.bank_db.bank_by_bic('OASPDE6AXXX')
bank_4 == bank_2  # => false
```

## Licence

The code is availiable under the MIT-Licence
