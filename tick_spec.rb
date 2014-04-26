require "./tick.rb"

describe Tick, "#tock" do
	it "returns a String" do
		tick = Tick.new
		tick.tock("9:13 AM", 10).should be_a(String)
	end
end
