# encoding: utf-8
require "spec_helper"
require "rule/styles"
include Rule

describe Rule::Styles do

	context :Data do
		it "ルールデータが検索できる" do
			expect(Rule::Styles::Data[:tatara].name).to eq "タタラ"
			expect(Rule::Styles::Data[:tatara].ability.life.power).to eq 1
		end
	end

	context :Syms do
		it "クラスのシンボル一覧が順序を保って取得できる" do
			expect(Rule::Styles::Syms[0]).to eq :kabuki
			expect(Rule::Styles::Syms[1]).to eq :basara
			expect(Rule::Styles::Syms[2]).to eq :tatara
		end
	end

	context :to_key do
		it "クラスの日本語名からシンボルを取得できる" do
			expect(Rule::Styles.to_sym("タタラ")).to eq :tatara
		end
	end
end
