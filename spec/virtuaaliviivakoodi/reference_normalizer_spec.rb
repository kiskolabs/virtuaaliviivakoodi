require "spec_helper"

RSpec.describe Virtuaaliviivakoodi::ReferenceNormalizer do
  it "works with national reference with spaces" do
    expect(Virtuaaliviivakoodi::ReferenceNormalizer.call("12345 67891 23456 78917")).to eq("12345678912345678917")
  end

  it "works with national reference as number" do
    expect(Virtuaaliviivakoodi::ReferenceNormalizer.call(1232)).to eq("00000000000000001232")
  end

  it "works with international reference with spaces" do
    expect(Virtuaaliviivakoodi::ReferenceNormalizer.call("RF54 1111 35")).to eq("54000000000000000111135")
  end

  it "works with international reference" do
    expect(Virtuaaliviivakoodi::ReferenceNormalizer.call("RF54111135")).to eq("54000000000000000111135")
  end

  it "raises if there is no reference" do
    expect {
      Virtuaaliviivakoodi::ReferenceNormalizer.call("")
    }.to raise_error(ArgumentError, "Reference is not valid")
  end

  it "raises if there is invalid reference" do
    expect {
      Virtuaaliviivakoodi::ReferenceNormalizer.call("102987-2863")
    }.to raise_error(ArgumentError, "Reference is not valid")
  end
end
