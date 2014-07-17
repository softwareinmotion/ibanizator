Gem::Specification.new do |s|
  s.name = 'ibanizator'
  s.version = '0.1.7'
  s.date = '2014-06-27'
  s.licenses    = ['MIT']
  s.summary = 'An IBAN generator/validator and BIC generator for german accounts.'
  s.description = 'ibanizator generates the correct IBAN for given account number and bank number for german accounts. It is possible to validate given international IBANS. Calculates also the BIC and bank names for given german bank codes.'
  s.authors = ["Christoph Stettner"]
  s.email = 'christoph.stettner@softwareinmotion.de'
  s.files = ["lib/ibanizator.rb", "lib/iban/validator.rb", "lib/iban/lengths.rb", "lib/swift_bic/bank_db.rb", "db/blz.txt"]
  s.files += Dir["lib/errors/*.rb"]
  s.homepage = 'https://github.com/softwareinmotion/ibanizator'

  s.add_dependency 'equalizer', '~> 0.0.9'
  s.add_dependency 'adamantium', '~> 0.2.0'

  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'guard-rspec', '~> 4.2.10'
end
