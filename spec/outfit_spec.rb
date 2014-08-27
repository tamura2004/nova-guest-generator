# encoding: utf-8
require "spec_helper"
require "guest"
require "outfit"

describe :Outfits do
	subject :outfits do
		guest = Guest.new.tap do |g|
			g.styles[0].sym = :arashi
			g.styles[1].sym = :hiruko
			g.styles[2].sym = :neuro
		end
		Outfits.new(guest)
	end

	describe :initialize do
		it{expect(outfits.include? "ウォーカー").to eq true}
		it{expect(outfits.include? "搭載兵器").to eq true}
		it{expect(outfits.include? "変異器官").to eq true}
		it{expect(outfits.include? "タップ").to eq true}
		it{expect(outfits.include? "ソフトウェア").to eq true}

	end

	describe :include do
		it{
			expect(outfits.include? Rule::Outfits::Mustbuy[0]).to eq true
			expect(outfits.include? Rule::Outfits::Mustbuy[1]).to eq true
		}
	end
end
