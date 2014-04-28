require "./tick.rb"

describe Tick, "#tock" do

	before do
		@tick = Tick.new
	end

	it "should return a String" do
		result = @tick.tock("9:13 AM", 10)
		expect(result).to be_a(String)
	end

	it "should increment minutes" do
		result = @tick.tock("9:13 AM", 10)
		expect(result).to eql("9:23 AM")
	end

	it "should increment hours when minutes are greater than 59" do
		result = @tick.tock("9:13 AM", 47)
		expect(result).to eql("10:00 AM")
	end
end
