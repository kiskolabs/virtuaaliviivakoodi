require "bigdecimal"
require "iban-tools"
require "virtuaaliviivakoodi/iban_normalizer"
require "virtuaaliviivakoodi/reference_normalizer"
require "virtuaaliviivakoodi/due_date_normalizer"
require "virtuaaliviivakoodi/amount_normalizer"

module Virtuaaliviivakoodi
  class Generator
    attr_reader :iban, :reference, :amount, :due_date

    def initialize(iban:, reference:, amount: nil, due_date: nil)
      @iban = iban
      @reference = reference
      @amount = amount
      @due_date = due_date
    end

    def call
      reference_to_version + normalized_iban + normalized_amount + Virtuaaliviivakoodi.pad(normalized_reference, 23) + normalized_due_date
    end

    private

    def normalized_due_date
      Virtuaaliviivakoodi::DueDateNormalizer.call(due_date)
    end

    def normalized_iban
      Virtuaaliviivakoodi::IBANNormalizer.call(iban)
    end

    def normalized_reference
      Virtuaaliviivakoodi::ReferenceNormalizer.call(reference)
    end

    def normalized_amount
      Virtuaaliviivakoodi::AmountNormalizer.call(amount)
    end

    def reference_to_version
      if normalized_reference.size == 23
        # international
        "5"
      elsif normalized_reference.size == 20
        # national
        "4"
      else
        raise ArgumentError, "Given reference is not of proper length. Should be either 23 or 20 characters long."
      end
    end
  end
end
