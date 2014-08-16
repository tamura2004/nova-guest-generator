require "skill.rb"

describe Skill do

	subject(:skill) do
		Skill.new(
			name:"射撃",
			type: 1,
			level: 1,
			mark: 1,
			rule: "TNA",
			page: 120
		)
	end

	describe "#to_s" do

		subject{skill.to_s}

		it "ベース技能の表示" do
			is_expected.to eq "●○○○〈★射撃〉１（TNA120）"
		end
	end

end
