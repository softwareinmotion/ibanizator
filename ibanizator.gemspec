Gem::Specification.new do |s|
  s.name = 'ibanizator'
  s.version = '0.1.2'
  s.date = '2013-05-03'
  s.summary = 'An IBAN generator/validator for german accounts.'
  s.description = 'ibanizator generates the correct IBAN for given account number and bank number for german accounts. It is possible to validate given international IBANS. Calculates also the BIC and bank names for given german bank codes.'
  s.authors = ["Christoph Stettner"]
  s.email = 'christoph.stettner@softwareinmotion.de'
  s.files = ["lib/ibanizator.rb", "lib/iban/validator.rb", "lib/iban/lengths.rb", "lib/swift_bic/bank_db.rb", "db/blz.db"]
  s.homepage = 'https://github.com/softwareinmotion/ibanizator'
  s.add_runtime_dependency 'sqlite3', '~> 1.3', '>= 1.3.7'
end
