# encoding: utf-8
require_relative "../csv_loader"

module Rule
	Outfit = Struct.new(:id,:group,:type,:name,:exp,:rule,:page)

	module Outfits
		Data = []
		CSVLoader.each_row("outfits") do |row|
			next if row[:exp] < 4
			next if row[:exp] > 40

			Data << Outfit[*row.values]
		end

		Groups = %w(武器 防具 サイバーウェア ヴィークル トロン 生体装備 カルチャーウェア サービス 住居 その他)


		Buy = Struct.new(:style,:group,:type,:minexp,:maxexp)

		Mustbuy = [
			Buy[:arashi,nil,"ウォーカー",10,nil],
			Buy[:arashi,nil,"搭載兵器",4,nil],
			Buy[:kaze,"ヴィークル",nil,10,nil],
			Buy[:kaze,nil,"搭載兵器",10,nil],
			Buy[:kabutowari,nil,"射撃武器",10,nil],
			Buy[:katana,nil,"白兵武器",10,nil],
			Buy[:hiruko,nil,"変異器官",5,nil],
			Buy[:hiruko,nil,"変異器官",5,nil],
			Buy[:neuro,nil,"タップ",5,nil],
			Buy[:neuro,nil,"ソフトウェア",5,nil],
			Buy[:neuro,nil,"ソフトウェア",5,nil],
		]

		Basics = [
			Buy[nil,nil,"射撃武器",nil,nil],
			Buy[nil,nil,"白兵武器",nil,nil],
			Buy[nil,nil,"ボディアーマー",nil,nil],
		]

		Types = Data.map(&:type).uniq - Mustbuy.map(&:type) - Basics.map(&:type)
	end
end
