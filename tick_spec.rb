require "./tick.rb"

describe Tick, "#tock" do

	it "should return a String" do
		result = Tick.tock("9:13 AM", 10)
		expect(result).to be_a(String)
	end

	it "should increment minutes" do
		result = Tick.tock("9:13 AM", 10)
		expect(result).to eql("9:23 AM")
	end

	it "should increment hours when minutes are greater than 59" do
		result = Tick.tock("9:13 AM", 47)
		expect(result).to eql("10:00 AM")
	end

	it "should flip the period (AM/PM) when hours are greater than 11" do
		result = Tick.tock("11:21 AM", 39)
		expect(result).to eql("12:00 PM")
	end
end
