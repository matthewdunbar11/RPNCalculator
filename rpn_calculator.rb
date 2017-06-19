require_relative './incorrect_inputs_error'

class RPNCalculator

	def initialize
		@input_items = []
		@result = 0
	end

	def Input(text)
		begin
			value = Float(text)
			@input_items.push(value)

			if(@input_items.count > 2)
				@input_items.drop(1)
			end
		rescue ArgumentError #This means we didnt' receive a float, we probably received an arithmetic operator
			if @input_items.count == 1
				@val1 = @result
				@val2 = @input_items.pop
			else
				@val2 = @input_items.pop
				@val1 = @input_items.pop
			end

			case text
			when "+"
				@result = @val1 + @val2
			when "*"
				@result = @val1 * @val2
			when "-"
				@result = @val1 - @val2
			end

		end
	end

	def Result
		@result
	end
end