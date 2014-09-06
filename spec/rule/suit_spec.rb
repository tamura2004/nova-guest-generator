# encoding: utf-8
require "spec_helper"
require "rule/suit"
include Rule

describe Rule::Suit do
	subject :suit do
		Suit[1,2,3,4]
	end

	let :other do
		Suit[5,6,7,8]
	end

	context :add do
		it "ベクトル加算が可能" do
			expect(suit + other).to eq Suit[6,8,10,12]
		end
	end
end

describe Rule::S do
	subject :s do
		S[1,2,3,4]
	end

	let :other do
		S[5,6,7,8]
	end

	context "短縮別名S" do
		it "ベクトル加算が可能" do
			expect(s + other).to eq S[6,8,10,12]
		end
	end
end

# describe Rule::Suit do
# 	context :Base do
# 		it "初期値" do
# 			expect(Rule::Suit::Base.reason.power).to eq 0
# 		end
# 	end
# end

# describe Rule::Suit do
# 	subject :suit do
# 		Suit[]
# 	end

# 	context :set do
# 		it "代入" do
# 			suit.set Suit::Base
# 			expect(suit.reason.power).to eq 0
# 		end
# 	end
# end
