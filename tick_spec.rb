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

	it "should flip the period from AM to PM when hours are greater than 11 when starting at AM" do
		result = Tick.tock("11:21 AM", 39)
		expect(result).to eql("12:00 PM")
	end

	it "should flip the period from PM to AM when hours are greater than 11 when starting at PM" do
		result = Tick.tock("11:21 PM", 39)
		expect(result).to eql("12:00 AM")
	end

	it "should do nothing when increment is 1440 (24 hours)" do
		result = Tick.tock("1:37 PM", 1440)
		expect(result).to eql("1:37 PM")
	end

	it "produces the same output as Ruby's DateTime class when given ten (10) random input strings and increment values" do
		10.times do

			# Generate random input
			period = rand(0..1) ? "AM" : "PM"
			string = "#{rand(1..12)}:#{sprintf('%02d', rand(0..59))} #{period}"
			minutes = rand(0..5000)
			puts "Input: (#{string}, #{minutes})"

			# Compute answers
			my_result = Tick.tock(string, minutes)
			ruby_time = DateTime.strptime(string, "%l:%M %p") + Rational(minutes, 1440)
			ruby_result = ruby_time.strftime("%l:%M %p").strip

			# Compare answers
			expect(ruby_result).to eql(my_result)
		end
	end
end
