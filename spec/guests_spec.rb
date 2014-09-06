# encoding: utf-8
require "spec_helper"
require "guests"

describe Guests do
	subject :guests do
		Guests.new
	end

	context :method do
		it "describe" do
			expect(guests[0].styles[0].name).to eq "アラシ"
		end
	end


end
