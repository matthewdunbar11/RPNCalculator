require_relative './rpn_calculator'

@rpn_calculator = RPNCalculator.new

p "Welcome to the Reverse Polish Notation calculator. Enter numbers and operators (+, -, *, /). You can do either one per line or space separated."

done = false
while !done && input = gets
	input = input.chomp

	input.split(" ").each do |value|
		if(value == "q") 
			done = true
			break
		else
			puts @rpn_calculator.Input(value)
		end
	end
end