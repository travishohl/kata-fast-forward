require './my_time.rb'

class Tick < Object

	def tock(string, increment)

		# Create a new instance of My_Time
		time = My_Time.new(string)

		# Ask the instance to increment itself and return itself
		# represented as a string
		return time.increment(increment).to_s
	end
end
