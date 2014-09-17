require 'bike'
require 'bike_container'
require 'van'

describe Van do

	let(:van) {Van.new}
	let(:bike) {Bike.new}

	it "should accept broken bikes" do
		van.accept(bike)
		expect(bike).to be_broken
	end

	it "should release fixed bikes" do 
		van.dock(bike)
		expect{van.release(bike)}.to change{van.bike_count}.by -1
	end

	
end