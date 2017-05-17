module Virtuaaliviivakoodi
  class AmountNormalizer
    def self.call(value)
      amount = value.to_f

      if amount
        raise(ArgumentError, "Amount is negative") if (amount < 0)
        raise(ArgumentError, "Amount is too large, maximum is 999999.99") if (amount > 999999.99)

        decimals = digits_after_decimal_point(amount)
        raise(ArgumentError, "There can't be more than two decimals") if decimals > 2

        euros, cents = sprintf("%0.02f", amount).split(".")

        Virtuaaliviivakoodi.pad(euros, 6) + cents
      else
        Virtuaaliviivakoodi.pad("", 8)
      end
    end

    private

    def self.digits_after_decimal_point(f)
      sign, digits, base, exponent = BigDecimal(f.to_s).split
      digits.length - exponent
    end
  end
end
