require "abilities"
require "guest"

describe Abilities do
	subject(:a) do
		guest = Guest.new
		guest.styles[0].sym = :kabuki
		guest.styles[1].sym = :basara
		guest.styles[2].sym = :tatara
		Abilities.new(guest)
	end

	describe "#initialize" do
		it "初期化が正しく行われる" do
			expect(a.reason.power).to eq 6
			expect(a.cs).to eq "８"
		end
	end
end
