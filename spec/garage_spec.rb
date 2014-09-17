require 'garage'
require 'bike'
require 'bike_container'

describe Garage do

	def fill_garage(garage)
		garage.capacity.times { garage.dock(Bike.new) }
	end

	let(:bike) { Bike.new }
	let(:garage) { Garage.new }

	it "should fix broken bikes" do
		garage.accept(bike)
		expect(bike).not_to be_broken
	end

	it "should release fixed bikes" do
		garage.dock(bike)
		expect{garage.release(bike)}.to change{garage.bike_count}.by -1
	end

	it "should provide a list of unfixed bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		garage.dock(working_bike)
		garage.dock(broken_bike)
		expect(garage.unfixed_bikes).to eq([broken_bike])
	end


	it "should provide a list of fixed bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		garage.dock(working_bike)
		garage.dock(broken_bike)
		expect(garage.available_bikes).to eq([working_bike])
	end

end