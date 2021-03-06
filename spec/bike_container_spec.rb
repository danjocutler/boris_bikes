require 'bike'
require 'bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer  do

	def fill_holder(holder)
		holder.capacity.times { holder.dock(Bike.new) }
	end
	
	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }

	it "should accept a bike" do
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end

	it "should release a bike" do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)
	end

	it "should know when it's full" do
		expect(holder).not_to be_full
		holder.capacity.times { holder.dock(Bike.new) }
		expect(holder).to be_full
	end

	it "should not accept a bike if it's full" do
		fill_holder holder
		expect { holder.dock(bike) }.to raise_error "Bike storage is full"
	end

	it "should provide a list of available bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

	it "should provide a list of broken bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.broken_bikes).to eq([broken_bike])
	end

	it "should not release anything that is not a bike" do
		bike = !Bike.new
		expect { holder.release(bike) }.to raise_error "You have not released a bike"
	end

end