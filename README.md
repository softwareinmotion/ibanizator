# ibanizator

ibanizator calculates the iban for german accounts.

## Installation

Add this line to your application's Gemfile:

    gem 'ibanizator'

## Usage


### Calculate IBAN

To calculate the iban for some german accounts, just use this method:

    ibanizator = Ibanizator.new
    ibanizator.calculate_iban country_code: :de, bank_code: '12345678', account_number: '123456789'

In Version 0.0.1 the ibanizator gem only works for german accounts.

### Validate IBAN

To validate the iban you need to check the length and after this check the checksum. For details please refer to
the documentation online (e.g. http://es.wikipedia.org/wiki/IBAN).

This gem provides a simple validator for several contries. All countries that are listed in the Iban::LENGTHS hash are supported at the moment.

    validator = Iban::Validator.new
    valid = validator.validate_iban("DE68 2105 0170 0012 3456 78") # => true

There is an alternate way to validate an IBAN as a result of the 0.0.1 Version:

    ibanizator.validate_iban("DE68 2105 0170 0012 3456 78") # => true

The method returns true for valid ibans and false for invalid ibans. If the iban is too short or is using an unimplemented country code, the method throws an exception.

## Licence

The code is availiable under the MIT-Licence
