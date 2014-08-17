require "skill.rb"

describe Skill do

	subject(:skill) do

		BASIC = 0
		FEAT = 1
		MISTIQUE = 2
		ULTIMATE = 3

		Skill.new(
			name:"射撃",
			type: BASIC,
			level: 1,
			mark: {reason: true},
			rule: "TNA",
			page: 120
		)
	end

	context :to_s do
		it { expect(skill.to_s).to eq "●○○○〈★射撃〉１（TNA120）" }
	end

end

describe Skill::Type do
	context :BASE_SKILLS do
		it{ expect(Skill::Type::ACTION).to eq ["射撃","心理","自我","回避","操縦","白兵","圧力","信用"]}
	end
end