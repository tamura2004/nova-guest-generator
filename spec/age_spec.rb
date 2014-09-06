require "age"

describe Age do

	context "アヤカシの場合" do

		subject(:ages) do
			Array.new(100){Age.new(["アヤカシ"])}
		end

		it "年齢は９歳〜９９兆歳" do
			expect(ages.map(&:age)).to all(be_between(10,990))
			expect(ages.map(&:unit)).to all(eq("") | eq("万") | eq("億") | eq("兆"))
		end

		it "出力フォーマットが正しい" do
			expect(ages.map(&:to_s)).to all(match(/^[０-９]+.*歳$/))
		end
	end

	context "アヤカシ以外の場合" do

		subject(:ages) do
			Array.new(100){Age.new(["カタナ"])}
		end

		it "年齢は１４歳〜３３歳" do
			expect(ages.map(&:age)).to all(be_between(14,33))
			expect(ages.map(&:unit)).to all(eq(""))
		end

		it "出力フォーマットが正しい" do
			expect(ages.map(&:to_s)).to all(match(/^[０-９]+.*歳$/))
		end
	end

end