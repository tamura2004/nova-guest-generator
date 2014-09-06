# encoding: utf-8
require "spec_helper"
require "rule/outfits"

describe Rule::Outfits do
	describe :Data do
		describe :find do
			it "idで検索できる" do
				f = -> x {x.id == 8}
				expect(Rule::Outfits::Data.find(&f).name).to be_a String
			end

			it "nameで検索できる" do
				f = -> x {x.name == "バイパー"}
				expect(Rule::Outfits::Data.find(&f).exp).to be_a Fixnum
			end
		end

		describe :select do
			it "typeで絞り込み" do
				f = -> x {x.type == "ニューラルウェア"}
				expect(Rule::Outfits::Data.select(&f).first.name).to be_a String
			end
		end
	end
end
