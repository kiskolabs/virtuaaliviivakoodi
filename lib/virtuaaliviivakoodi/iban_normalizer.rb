module Virtuaaliviivakoodi
  class IBANNormalizer
    def self.call(iban)
      iban_validator = IBANTools::IBAN.new(iban)

      raise(ArgumentError, "IBAN is not valid") unless iban_validator.validation_errors.empty?
      raise(ArgumentError, "IBAN is not Finnish") unless iban_validator.country_code == "FI"

      # No country code
      iban_validator.code[2..-1]
    end
  end
end
