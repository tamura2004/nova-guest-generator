# encoding: utf-8
require "spec_helper"
require "rule/style"

describe Rule::Style do
	subject :style do
		Rule::Style[0,"カブキ"]
	end

	context :methods do
		it "id,sym,ability,nameを持つ" do
			expect(style).to be_respond_to :id
			expect(style).to be_respond_to :sym
			expect(style).to be_respond_to :ability
			expect(style).to be_respond_to :name
		end
	end


end
