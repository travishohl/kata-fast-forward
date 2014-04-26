time-code-challenge
===================

Without using any of Ruby's Date or Time classes, write a method that increments a given time by a given number of minutes. The first argument should be a string of the format "[H]H:MM {AM|PM}" and the second argument should be an integer. Assume the integer is the number of minutes to add to the string. The method should return a string representing the incremented time that is the same format as the first argument.

Example
-------

	irb(main):001:0> your_class = YourClass.new
	irb(main):002:0> your_class.your_method("9:13 AM", 10)
	=> "9:23 AM"
