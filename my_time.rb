# A class to contain all of the time-related data and methods
class My_Time < Object

attr_accessor :hours
attr_accessor :minutes
attr_accessor :period

	def initialize(string)
		# Parse the string using a regular expression
		matches = string.match(/^(\d{1,2}):(\d{2}) (AM|PM)$/i)

		# Assign matches to instance variables
		@hours = matches[1].to_i
		@minutes = matches[2].to_i
		@period = matches[3]

		return self
	end

	def increment(increment)
		# Increment minutes
		@minutes += increment

		# Increment hours, if necessary
		if @minutes > 59
			@hours += (@minutes / 60)
			@minutes = (@minutes % 60)

			# Swap am and pm, if necessary
			swaps = (@hours / 12)
			swap_am_pm unless swaps.even?

			# Handle case when we increment more than 24 hours
			@hours = (@hours % 24)

			# Convert from military time to 12-hour, if necessary
			if (@hours > 12)
				@hours = @hours - 12
				swap_am_pm # and remember to do one more swap
			end
		end

		return self
	end

	def swap_am_pm
		if (@period == "AM")
			@period = "PM"
		else
			@period = "AM"
		end
	end

	def to_s
		return "#{@hours}:#{"%02d" % @minutes} #{@period}"
	end
end
