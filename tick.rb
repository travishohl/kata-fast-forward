class Tick < Object

	attr_accessor :hours
	attr_accessor :minutes
	attr_accessor :period
	
	def tock(string, increment)

		# Parse the string using a regular expression
		matches = string.match(/^(\d{1,2}):(\d{2}) (AM|PM)$/i)

		# Assign matches to instance variables
		@hours = matches[1].to_i
		@minutes = matches[2].to_i
		@period = matches[3]

		# Perform math on minutes
		@minutes += increment

		return "#{@hours}:#{@minutes} #{@period}"
	end
end
