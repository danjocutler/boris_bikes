require 'bike'
require 'bike_container'
require 'van'

describe Van do

	def fill_van(van)
		van.capacity.times { van.dock(Bike.new) }
	end

	let(:bike) { Bike.new }
	let(:van) { Van.new }

	it "should accept a bike" do
		# we expect the holder to have 0 bikes
		expect(van.bike_count).to eq(0)
		# Let's dock a bike into the holder
		van.dock(bike)
		# now we expect the holder to have 1 bike
		expect(van.bike_count).to eq(1)
	end

	it "should release a bike" do
		van.dock(bike)
		van.release(bike)
		expect(van.bike_count).to eq(0)
	end

	it "should know when it's full" do
		expect(van).not_to be_full
		van.capacity.times { van.dock(Bike.new) }
		expect(van).to be_full
	end

	it "should not accept a bike if it's full" do
		fill_van van
		expect(lambda { van.dock(bike) }).to raise_error(RuntimeError)
	end

	
end