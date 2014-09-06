require "mark"

describe Mark do

	context "１レベルで初期化" do
		subject(:mark) do
			Mark.new(:reason)
		end

		it "省略値も含めて正しく初期化される" do
			expect(mark.reason).to be_truthy
			expect(mark.passion).to be_falsy
			expect(mark.life).to be_falsy
			expect(mark.mundane).to be_falsy
		end

		it "指定してマークを変更できる" do
			expect{mark.life = true}.to change{mark.to_s}.from("●○○○").to("●○●○")
		end

		it "塗りつぶされていないマークを一つ塗りつぶす" do
			expect{mark.inc!}.to change{mark.count(true)}.from(1).to(2)
		end

		it "１０レベル成長させても４レベルで止まる" do
			expect{mark.add!(10)}.to change{mark.level}.from(1).to(4)
		end

		it "１０レベルまで成長させても４レベルで止まる" do
			expect{mark.grow_upto!(10)}.to change{mark.level}.from(1).to(4)
		end
	end

	# context "４レベルで初期化" do
	# 	subject(:mark) do
	# 		Mark.new(true,true,true,true)
	# 	end

	# 	it "省略値も含めて正しく初期化される" do
	# 		expect(mark.reason).to be_truthy
	# 		expect(mark.passion).to be_truthy
	# 		expect(mark.life).to be_truthy
	# 		expect(mark.mundane).to be_truthy
	# 		expect(mark.to_s).to eq "■■■■"
	# 	end

	# 	it "レベルアップしても変わらない" do
	# 		expect{mark.inc!}.to_not change{mark.count(true)}
	# 	end
	# end


end