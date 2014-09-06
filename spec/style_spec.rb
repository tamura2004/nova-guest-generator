require "style"

describe :Style do
	subject(:style){Style[:katana]}

	describe :initizlize do
		it "初期化が正しく行える" do
			expect(style.sym).to eq :katana
			expect(style.to_s).to eq "カタナ"
			expect(style.name).to eq "カタナ"
			expect(style.ability.reason.control).to eq 4
		end
	end

	describe :sym do
		it "symを変更するとnameが変わる" do
			expect{style.sym = :arashi}.to change{style.to_s}.from("カタナ").to("アラシ")
		end
	end

	describe :sym do
		it "nameを変更するとsymが変わる" do
			expect{style.name = "アラシ"}.to change{style.sym}.from(:katana).to(:arashi)
		end
	end

	describe :key do
		it "keyを変更すると表示が変わる" do
			expect{style.key = true}.to change{style.to_s}.from("カタナ").to("●カタナ")
		end
	end

	describe :key do
		it "personaを変更すると表示が変わる" do
			expect{style.persona = true}.to change{style.to_s}.from("カタナ").to("◎カタナ")
		end
	end

	describe :key_persona do
		it "personaとkeyを変更すると表示が変わる" do
			expect{style.persona = true;style.key = true}.to change{style.to_s}.from("カタナ").to("●◎カタナ")
		end
	end

	describe :change do
		context :not_fixed do
			it "changeでnameとsymが変更される" do
				expect{style.change}.to change{style.sym}
				expect{style.change}.to change{style.to_s}
			end
		end

		context :fixed do
			it "changeでnameとsymが変更されない" do
				style.fixed = true
				expect{style.change}.to_not change{style.sym}
				expect{style.change}.to_not change{style.to_s}
			end
		end

	end
end
