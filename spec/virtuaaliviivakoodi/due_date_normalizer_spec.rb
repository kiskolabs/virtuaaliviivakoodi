require "spec_helper"

RSpec.describe Virtuaaliviivakoodi::DueDateNormalizer do
  it "works with valid string" do
    expect(Virtuaaliviivakoodi::DueDateNormalizer.call("160222")).to eq("160222")
  end

  it "works with date" do
    expect(Virtuaaliviivakoodi::DueDateNormalizer.call(Date.new(2016, 2, 22))).to eq("160222")
  end

  it "works with time" do
    expect(Virtuaaliviivakoodi::DueDateNormalizer.call(Time.new(2016, 2, 22, 10, 10))).to eq("160222")
  end

  it "works with datetime" do
    expect(Virtuaaliviivakoodi::DueDateNormalizer.call(Time.new(1998, 12, 2, 10, 10))).to eq("981202")
  end

  it "raises if totally incorrect" do
    expect {
      Virtuaaliviivakoodi::DueDateNormalizer.call("1234567")
    }.to raise_error(ArgumentError, "Due date is not valid")
  end
end
