require_relative './incorrect_inputs_error'

class RPNCalculator

	def initialize
		@input_items = []
	end

	def Input(text)
		if text =~ /\A-?[0-9]*(\.[0-9]*)?\Z/ #regex to determine if numeric with optional negative and decimal
			if @input_items.count > 1
				raise IncorrectInputsError, "More than two numbers were provided"
			else
				@input_items.push(text.to_f)
			end
		elsif text == "+"
			if @input_items.count != 2
				raise IncorrectInputsError, "Only one number was provided"
			else
				@result = @input_items.pop + @input_items.pop				
			end
		end
	end

	def Result
		@result
	end
end