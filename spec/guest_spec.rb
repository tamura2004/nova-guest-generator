#require_relative "spec_helper.rb"
require "guest"

describe Guest do

	subject(:guest){
		Guest.new.tap{|g|g.styles[0].sym = :arashi}
	}

	it "スタイルを持つかどうか判別できる" do
		expect(guest.include? :arashi).to be true
	end

	it "スキルを持つかどうか判別できる" do
		expect(guest.include?(guest.skills.first.name)).to be true
		expect(guest.include?(guest.skills.last.name)).to be true
	end

	it "アウトフィットを持つかどうか判別できる" do
		expect(guest.include?(guest.outfits.first.group)).to be true
		expect(guest.include?(guest.outfits.first.type)).to be true
	end

end