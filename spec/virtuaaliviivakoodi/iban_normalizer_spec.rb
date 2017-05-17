require "spec_helper"

RSpec.describe Virtuaaliviivakoodi::IBANNormalizer do
  it "works with valid Finnish IBAN" do
    expect(Virtuaaliviivakoodi::IBANNormalizer.call("FI21 1234 5600 0007 85")).to eq("2112345600000785")
  end

  it "raises if totally incorrect" do
    expect {
      Virtuaaliviivakoodi::IBANNormalizer.call("623963587892")
    }.to raise_error(ArgumentError, "IBAN is not valid")
  end

  it "raises if not valid Finnish IBAN" do
    expect {
      Virtuaaliviivakoodi::IBANNormalizer.call("FI34 1234 5600 0007 85")
    }.to raise_error(ArgumentError, "IBAN is not valid")
  end

  it "raises if not Finnish IBAN" do
    expect {
      Virtuaaliviivakoodi::IBANNormalizer.call("EE38 2200 2210 2014 5685")
    }.to raise_error(ArgumentError, "IBAN is not Finnish")
  end
end
