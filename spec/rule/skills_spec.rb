# encoding: utf-8
require "spec_helper"
require "rule/skills"

describe Rule::Skills do
	subject :feats do
		Rule::Skills::Feats
	end

	subject :basics do
		Rule::Skills::Basics
	end

	context :Feats do
		it "describe" do
			expect(feats.map(&:sym)).to all(be_a Symbol)
			expect(feats.map(&:no)).to all(be >= 0)
			expect(feats.map(&:no)).to all(be <= 26)
			expect(feats.map(&:style)).to all(be_a String)
			expect(feats.map(&:type)).to all(be >= 0)
			expect(feats.map(&:type)).to all(be <= 3)
			expect(feats.map(&:name)).to all(be_a String)
			expect(feats.map(&:rule)).to all(be_a String)
			expect(feats.map(&:page)).to all(be_a Fixnum)
			expect(feats.map(&:mark)).to all(be_a Symbol)
		end
	end

	context :Basics do
		it "describe" do
			expect(basics.map(&:sym)).to all(eq nil)
			expect(basics.map(&:no)).to all(eq nil)
			expect(basics.map(&:style)).to all(eq nil)
			expect(basics.map(&:type)).to all(eq 0)
			expect(basics.map(&:name)).to all(be_a String)
			expect(basics.map(&:rule)).to all(eq nil)
			expect(basics.map(&:page)).to all(eq nil)
			expect(basics.map(&:mark)).to all(be_a Symbol)
		end
	end
end
