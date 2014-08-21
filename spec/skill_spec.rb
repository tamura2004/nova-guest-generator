require "skill.rb"

describe Skill do

	subject(:skill) do

		Skill.new(
			name:"射撃",
			type: 0,
			level: 1,
			mark: {reason: true},
			rule: "TNA",
			page: 120
		)
	end

	context :inc! do
		it { expect{skill.inc!}.to change{skill.level}.from(1).to(2)}
	end

	context :to_s do
		it { expect(skill.to_s).to eq "■○○○〈★射撃〉１" }
	end

end

