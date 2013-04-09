# ibanizator

ibanizator calculates the iban for german accounts.

## Installation

Add this line to your application's Gemfile:

  gem 'ibanizator'

## Usage

To calculate the iban for some german accounts, just use this method:

  ibanizator = Ibanizator.new
  ibanizator.calculate_iban country_code: :de, bank_number: '12345678', account_number: '123456789'

In Version 0.0.1 the ibanizator gem only works for german accounts.