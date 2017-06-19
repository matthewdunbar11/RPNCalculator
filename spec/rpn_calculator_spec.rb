require_relative '../rpn_calculator'
require_relative '../incorrect_inputs_error'


describe RPNCalculator do
	before :each do
		@rpn_calculator = RPNCalculator.new
	end

	it 'should correctly add two numbers' do

		@rpn_calculator.Input('4')
		@rpn_calculator.Input('5')
		@rpn_calculator.Input('+')
		expect(@rpn_calculator.Result).to eq(9)
	end

	it 'should throw error if only one number added' do
		@rpn_calculator.Input('4')
		expect {
			@rpn_calculator.Input('+')
		}.to raise_exception IncorrectInputsError
	end

	it 'shoudl throw error if more than two numbers are input' do
		@rpn_calculator.Input('4')
		@rpn_calculator.Input('6')
		expect {
			@rpn_calculator.Input('7')
		}.to raise_exception IncorrectInputsError
	end
end