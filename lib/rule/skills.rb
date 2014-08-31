# encoding: utf-8
require_relative "styles"
require_relative "../csv_loader"

module Rule

	Skill = Struct.new(:sym,:no,:style,:type,:name,:rule,:page,:mark)


	module Skills

		# 特技/秘技/奥義一覧
		Feats = []
		CSVLoader.each_row("style_skills") do |row|

			sym = Styles.to_sym(row[:style]) # スタイルのシンボル名

			# 番号をスートのシンボルに変更
			row[:mark] = Rule::Suit.members[row[:mark]]


			# CSVデータに無いスタイルのシンボル名を先頭に追加
			Feats << Skill[*([sym] + row.values)]
		end

		# 無条件取得技能
		Basics	= [
			Skill[nil,nil,nil,0,"射撃",nil,nil,:reason],
			Skill[nil,nil,nil,0,"知覚",nil,nil,:reason],
			Skill[nil,nil,nil,0,"電脳",nil,nil,:reason],
			Skill[nil,nil,nil,0,"心理",nil,nil,:passion],
			Skill[nil,nil,nil,0,"自我",nil,nil,:passion],
			Skill[nil,nil,nil,0,"交渉",nil,nil,:passion],
			Skill[nil,nil,nil,0,"運動",nil,nil,:life],
			Skill[nil,nil,nil,0,"回避",nil,nil,:life],
			Skill[nil,nil,nil,0,"白兵",nil,nil,:life],
			Skill[nil,nil,nil,0,"圧力",nil,nil,:mundane],
			# Skill[nil,nil,nil,0,"隠密",nil,nil,:mundane],
		]
	end
end
