require_relative './incorrect_inputs_error'

class RPNCalculator

	def initialize
		@input_items = []
		@old_input_items = []
		@result = 0
	end

	def Input(text)
		begin
			value = Float(text)
			@input_items.push(value)
			
			while(@input_items.count > 2)
				@old_input_items.push(@input_items.shift)
			end

			return value
		rescue ArgumentError #This means we didnt' receive a float, we probably received an arithmetic operator
			if @input_items.count == 0 && @old_input_items.count > 0
				@val2 = @result
				@val1 = @old_input_items.pop			
			elsif @input_items.count == 1
				@val1 = @result
				@val2 = @input_items.pop
			elsif @input_items.count == 2
				@val2 = @input_items.pop
				@val1 = @input_items.pop
			else
				return
			end

			case text
			when "+"

				@result = @val1 + @val2
			when "*"
				@result = @val1 * @val2
			when "-"
				@result = @val1 - @val2
			when "/"
				@result = @val1 / @val2
			end

			return @result
		end
	end

	def Result
		@result
	end
end