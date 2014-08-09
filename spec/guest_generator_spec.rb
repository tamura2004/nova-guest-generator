require "./guest_generator.rb"

describe Guest::Skill do
	skill = Skill.new("射撃",0,1,1)
	context "１レベル" do
		describe "#mark_inspect" do
			subject {skill.mark_inspect}
			it {is_expected.to eq "●○○○"}
		end

		describe "#inspect" do
			subject {skill.inspect}
			it {is_expected.to eq "●○○○〈★射撃〉１"}
		end
	end
end
