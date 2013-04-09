# ibanizator

ibanizator calculates the iban for german accounts.

## Installation

Add this line to your application's Gemfile:

    gem 'ibanizator'

## Usage

For all methods you need an ibanizator object.

    ibanizator = Ibanizator.new

### Calculate IBAN

To calculate the iban for some german accounts, just use this method:

    ibanizator.calculate_iban country_code: :de, bank_number: '12345678', account_number: '123456789'

In Version 0.0.1 the ibanizator gem only works for german accounts.

### Validate IBAN

Validating iban checks the iban with the checksum.

    ibanizator.validate_iban iban

The method returns true for valid ibans and false for invalid ibans.
If the iban is too short or is using an unimplemented country code, the method throws an exception.

Validation also works only for german accounts.

## Licence

The code is availiable under the MIT-Licence