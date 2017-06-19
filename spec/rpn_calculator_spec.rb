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

	it 'should assume starting result of 0 if only one number added' do
		@rpn_calculator.Input('4')
		@rpn_calculator.Input('+')
		
		expect(@rpn_calculator.Result).to eq(4)
	end
	

	it 'should add two most recent numbers if more than two numbers are entered' do
		@rpn_calculator.Input('4')
		@rpn_calculator.Input('3')
		@rpn_calculator.Input('10')
		@rpn_calculator.Input('+')

		expect(@rpn_calculator.Result).to eq(13)
	end

	it 'should add a third number sent after addition' do
		@rpn_calculator.Input('5')
		@rpn_calculator.Input('6')
		@rpn_calculator.Input('+')
		@rpn_calculator.Input('7')
		@rpn_calculator.Input('+')

		expect(@rpn_calculator.Result).to eq(18)
	end

	it 'should multiply integers' do
		@rpn_calculator.Input('3')
		@rpn_calculator.Input('6')
		@rpn_calculator.Input('*')

		expect(@rpn_calculator.Result).to eq(18)
	end

	it 'should multiply decimals' do
		@rpn_calculator.Input('2.5')
		@rpn_calculator.Input('5.4')
		@rpn_calculator.Input('*')

		expect(@rpn_calculator.Result).to eq(13.5)
	end

	it 'should multiple one negative number' do
		@rpn_calculator.Input('-6.1')
		@rpn_calculator.Input('4.23')
		@rpn_calculator.Input('*')

		expect(@rpn_calculator.Result).to eq(-25.803)
	end

	it 'should multiply two negative numbers' do
		@rpn_calculator.Input('-2.1')
		@rpn_calculator.Input('-7.1')
		@rpn_calculator.Input('*')

		expect(@rpn_calculator.Result).to eq(14.91)		
	end

	it 'should multiply ater adding' do
		@rpn_calculator.Input('4')
		@rpn_calculator.Input('5')
		@rpn_calculator.Input('+')
		@rpn_calculator.Input('4')
		@rpn_calculator.Input('*')

		expect(@rpn_calculator.Result).to eq(36)
	end

	it 'should add after multiplying' do
		@rpn_calculator.Input('4')
		@rpn_calculator.Input('5')
		@rpn_calculator.Input('*')
		@rpn_calculator.Input('4')
		@rpn_calculator.Input('+')

		expect(@rpn_calculator.Result).to eq(24)
	end

	it 'should subtract two numbers' do
		@rpn_calculator.Input('4')
		@rpn_calculator.Input('5')
		@rpn_calculator.Input('-')

		expect(@rpn_calculator.Result).to eq(-1)
	end
end