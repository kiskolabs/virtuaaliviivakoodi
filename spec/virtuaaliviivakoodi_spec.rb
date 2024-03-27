require "spec_helper"

RSpec.describe Virtuaaliviivakoodi do
  it "has a version number" do
    expect(Virtuaaliviivakoodi::VERSION).not_to be nil
  end

  it "works with v4 reference" do
    expect(Virtuaaliviivakoodi.generate({
      iban: "FI37 1590 3000 0007 76",
      reference: 11112,
      amount: 12.25,
      due_date: "161221"
    })).to eq("437159030000007760000122500000000000000000011112161221")
  end

  it "works with v5 reference" do
    expect(Virtuaaliviivakoodi.generate({
      iban: "FI37 1590 3000 0007 76",
      reference: "RF9811112",
      amount: 1.1,
      due_date: "170101"
    })).to eq("537159030000007760000011098000000000000000011112170101")
  end

  it "works without amount and due date" do
    expect(Virtuaaliviivakoodi.generate({
      iban: "FI37 1590 3000 0007 76",
      reference: 11112
    })).to eq("437159030000007760000000000000000000000000011112000000")
  end

  it "raises if no parameters given" do
    expect {
      Virtuaaliviivakoodi.generate
    }.to raise_error(ArgumentError)
  end

  it "raises if no IBAN given" do
    expect {
      Virtuaaliviivakoodi.generate({
        reference: "RF9811112",
        amount: 1.1,
        due_date: "170101"
      })
    }.to raise_error { |error|
      expect(error).to be_a(ArgumentError)
      expect(error.message).to match(/missing keyword: :?iban/)
    }
  end

  it "raises if no reference given" do
    expect {
      Virtuaaliviivakoodi.generate({
        iban: "FI37 1590 3000 0007 76",
        amount: 1.1,
        due_date: "170101"
      })
    }.to raise_error { |error|
      expect(error).to be_a(ArgumentError)
      expect(error.message).to match(/missing keyword: :?reference/)
    }
  end
end
