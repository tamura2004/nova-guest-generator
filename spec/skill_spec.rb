require "skill"
require "rule/skills"

describe Skill do
	context :basics do
		subject(:skill) do
			Skill.new(
				Rule::Skills::Basics[0]
			)
		end

		context :inc! do
			it { expect{skill.inc!}.to change{skill.level}.from(1).to(2)}
		end

		context :to_s do
			it { expect(skill.to_s).to eq "■○○○〈★射撃〉１" }
		end
	end
end

