require "spec_helper"

RSpec.describe Virtuaaliviivakoodi::AmountNormalizer do
  it "works with float with cents" do
    expect(Virtuaaliviivakoodi::AmountNormalizer.call(25.20)).to eq("00002520")
  end

  it "works with integer" do
    expect(Virtuaaliviivakoodi::AmountNormalizer.call(25)).to eq("00002500")
  end

  it "works with largest possible amount" do
    expect(Virtuaaliviivakoodi::AmountNormalizer.call(999999.99)).to eq("99999999")
  end

  it "works if amount is string" do
    expect(Virtuaaliviivakoodi::AmountNormalizer.call("25.20")).to eq("00002520")
  end

  it "raises if amount is too big" do
    expect {
      Virtuaaliviivakoodi::AmountNormalizer.call(1000000)
    }.to raise_error(ArgumentError, "Amount is too large, maximum is 999999.99")
  end

  it "raises if too many decimals" do
    expect {
      Virtuaaliviivakoodi::AmountNormalizer.call("25.255")
    }.to raise_error(ArgumentError, "There can't be more than two decimals")
  end

  it "raises if negative amount" do
    expect {
      Virtuaaliviivakoodi::AmountNormalizer.call(-25.25)
    }.to raise_error(ArgumentError, "Amount is negative")
  end
end
