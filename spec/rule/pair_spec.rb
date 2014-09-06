# encoding: utf-8
require "spec_helper"
require "rule/pair"
include Rule

describe Rule::Pair do
	subject :pair do
		Pair[1,2]
	end

	let :other do
		Pair[3,4]
	end

	context :add do
		it "ベクトルのように加算が可能" do
			expect(pair + other).to eq Pair[4,6]
		end
	end
end


describe Rule::P do
	subject :p do
		P[1,2]
	end

	let :other do
		P[3,4]
	end

	context "短縮別名P" do
		it "ベクトルのように加算が可能" do
			expect(p + other).to eq P[4,6]
		end
	end
end
