require "styles"

describe :Styles do
	subject(:styles){Styles.new}

	describe :initialize do
		it "シンボル、文字列名称のどちらでもスタイル有無チェックが可能" do
			styles[1].sym = :kage
			expect(styles.include?(:kage)).to be true
			expect(styles.include?("カゲ")).to be true
		end
	end


	describe :initialize do
		context :not_fixed do
			it "固定スタイルを持たない場合すべて変更される" do
				expect{styles.change}.to change{styles[0]}
				expect{styles.change}.to change{styles[1]}
				expect{styles.change}.to change{styles[2]}
			end
		end

		context :fixed do
			it "固定スタイルのみ変更されない" do
				styles[0].fixed = true
				expect{styles.change}.not_to change{styles[0].sym}
				expect{styles.change}.to change{styles[1].sym}
				expect{styles.change}.to change{styles[2].sym}
			end
		end
	end
end
