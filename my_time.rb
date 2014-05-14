# A class to contain all of the time-related data and functionality
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

	def increment(minutes)
		# Increment @minutes
		@minutes += minutes

		# Increment @hours, if necessary
		if @minutes > 59

			# Twelve (12) should really be treated like zero (0)
			# (see http://en.wikipedia.org/wiki/12-hour_clock)
			if (@hours == 12)
				@hours = 0
			end

			# Increment @hours and put remainder in @minutes
			@hours += (@minutes / 60)
			@minutes = (@minutes % 60)

			# Swap am and pm, if necessary
			swaps = (@hours / 12)
			swap_am_pm unless swaps.even?

			# Handle case when we increment more than 24 hours
			@hours = (@hours % 12)

			# Revert zero (0) back to twelve (12) again
			if (@hours == 0)
				@hours = 12
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

	# When a time is displayed (or converted to a string), use this format
	def to_s
		return "#{@hours}:#{"%02d" % @minutes} #{@period}"
	end
end
