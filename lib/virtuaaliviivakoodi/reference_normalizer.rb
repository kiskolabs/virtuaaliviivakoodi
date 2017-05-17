module Virtuaaliviivakoodi
  class ReferenceNormalizer
    REFERENCE_INTERNATIONAL_PATTERN = /^RF[0-9]{3,23}$/
    REFERENCE_NATIONAL_PATTERN = /^[0-9]{4,20}$/

    def self.call(reference)
      reference_without_whitespace = reference.to_s.gsub(/\s/, "")
      case reference_without_whitespace
      when REFERENCE_INTERNATIONAL_PATTERN
        # Pad everything after checksum
        reference_without_whitespace[2..3] + Virtuaaliviivakoodi.pad(reference_without_whitespace[4..-1], 21)
      when REFERENCE_NATIONAL_PATTERN
        # Pad everything
        Virtuaaliviivakoodi.pad(reference_without_whitespace, 20)
      else
        raise ArgumentError, "Reference is not valid"
      end
    end
  end
end
