time-code-challenge
===================

Without using any of Ruby's Date or Time classes, write a method that increments a given time by a given number of minutes. The first argument should be a string of the format "[H]H:MM {AM|PM}" and the second argument should be an integer. Assume the integer is the number of minutes to add to the string. The method should return a string representing the incremented time that is the same format as the first argument.

Examples
-------

The answer can implement a class method or an instance method, whichever you prefer.

	irb(main):001:0> your_class = YourClass.new
	irb(main):002:0> your_class.your_method("9:13 AM", 10)
	=> "9:23 AM"

	irb(main):001:0> YourClass.your_method("10:00 AM", 120)
	=> "12:00 PM"

My Implementation
-----------------

I've created a class called Tick that implements a class method called #tock. Necessary to #tock's implementation is a second class called My_Time, which handles all of the time-related functionality. My_Time is where the magic happens.

To run my implementation, copy the source code to your local machine (remember to `bundle install`) and run IRB from this project's directory with the following flag:

	irb -r "./tick.rb"

From IRB, invoke the class method Tick::tock, which will return the answer as a String:

	irb(main):001:0> Tick.tock("11:34 AM", 65)
	=> "12:39 PM"

There is also an RSpec test suite. From this project's directory, invoke the following command at the terminal:

	rspec tick_spec.rb
