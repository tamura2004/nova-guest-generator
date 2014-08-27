# encoding: utf-8
require_relative "styles"
require_relative "../csv_loader"

module Rule

	Skill = Struct.new(:sym,:mark,:no,:style,:type,:name,:rule,:page)

	module Skills

		# 特技/秘技/奥義一覧
		Feats = []
		CSVLoader.each_row("style_skills") do |row|

			sym = Styles.to_sym(row[:style]) # スタイルのシンボル名
			mark = nil # 特技は推奨マーク無し

			# CSVデータに無いスタイルのシンボル名を先頭に追加
			Feats << Skill[*([sym,mark] + row.values)]
		end

		# 無条件取得技能
		Basics	= [
			Skill[nil,:reason,	nil,nil,0,"射撃",nil,nil],
			Skill[nil,:passion,	nil,nil,0,"心理",nil,nil],
			Skill[nil,:passion,	nil,nil,0,"自我",nil,nil],
			Skill[nil,:life,	nil,nil,0,"回避",nil,nil],
			Skill[nil,:mundane,	nil,nil,0,"白兵",nil,nil],
			Skill[nil,:mundane,	nil,nil,0,"圧力",nil,nil],
		]
	end
end
