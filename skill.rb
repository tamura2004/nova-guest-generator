# encoding: utf-8

class Skill

	SETUP_SKILLS = [["射撃",1,1],["心理",1,2],["自我",1,2],["回避",1,4],["白兵",1,4],["圧力",1,8]]

	BASE_SKILLS = ["射撃","心理","自我","回避","操縦","白兵","圧力","信用"]

	ORDINAL = 0
	FEAT = 1
	MISTIQUE = 2
	ULTIMATE = 3

	SKILL = 3

	# :no, :style, :type, :name, :rule, :page
	STYLE_SKILLS = CSV.table("style_skills.csv")

	def self.generate(style_names)
		@skills = []
		def @skills.add_skill(name,type,level,mark,rule,page)
			if i = self.index{|e|e.name == name}
				self[i].add_level level
			else
				self << Skill.new(name,type,level,mark,rule,page)
			end
		end

		SETUP_SKILLS.each do |skill|
			@skills.add_skill skill[0],ORDINAL,skill[1],skill[2],"TNA",120
		end

		config = [
			[[5,1],[3,3],[2,2],[1,1]]
		]

		[ORDINAL, FEAT, MISTIQUE, ULTIMATE].each do |type|
			list = STYLE_SKILLS.select{|s|s[:type]==type && style_names.include?(s[:style])}
			pattern = config.sample
			pattern[type][0].times do
				skill = list.sample
				@skills.add_skill skill[:name], type, pattern[type][1], 0, skill[:rule], skill[:page]
			end
		end

		@skills
	end

	SPADE = 1
	CLUB = 2
	HEART = 4
	DIA = 8

	def initialize(name,type,level,mark,rule,page)
		@name = name
		@type = type
		@level = level
		@rule = rule
		@page = page
		@mark = 0
		if level == 1 && mark > 0
			@mark = mark
		else
			[level,4].min.times do
				inc_mark
			end
		end
	end

	attr_accessor :name,:type,:level,:rule,:page

	#  レベルを増やす、４レベルまではマークも塗りつぶす
	def add_level(level)
		level.times do
			@level += 1
			if @level <= 4
				inc_mark
			end
		end
	end

	# 塗りつぶされていないマークを一つ塗りつぶす
	def inc_mark
		@mark |= [SPADE,CLUB,HEART,DIA].select{|b|(b&@mark).zero?}.sample
	end

	# マーク表示用
	def mark_inspect
		("%04b" % @mark).reverse.gsub(/1/,"●").gsub(/0/,"○")
	end

	# スキル種類表示用
	def type_inspect
		type = ""
		case @type
		when ORDINAL
			if BASE_SKILLS.include?(@name)
				type = "★"
			end
		when MISTIQUE
			type = "†"
		when ULTIMATE
			type = "※"
		end
		type
	end

	# 全体表示用
	def inspect
		if type == ORDINAL
			"#{mark_inspect}〈#{type_inspect}#{name}〉#{level.to_zen}"
		else
			"#{mark_inspect}〈#{type_inspect}#{name}〉#{level.to_zen}（#{rule}#{page}）"
		end
	end
end