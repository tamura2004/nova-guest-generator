# encoding: utf-8

class Skill

	SETUP_SKILLS = [["射撃",1,1],["心理",1,2],["自我",1,2],["回避",1,4],["白兵",1,4],["圧力",1,8]]

	ORDINAL = 0
	FEAT = 1
	MISTIQUE = 2
	ULTIMATE = 3

	SKILL = 3

	def self.generate(styles)
		@skills = []
		def @skills.add_skill(name,type,level,mark)
			if i = self.index{|e|e.name == name}
				self[i].add_level level
			else
				self << Skill.new(name,type,level,mark)
			end
		end

		SETUP_SKILLS.each do |skill|
			@skills.add_skill skill[0],ORDINAL,skill[1],skill[2]
		end

		conf = [[4,1],[2,3],[1,2],[1,1]]
		[ORDINAL, FEAT, MISTIQUE, ULTIMATE].each do |type|
			list = styles.map{|e|e[SKILL][type]}.inject([]){|a,b|a+=b}
			conf[type][0].times do
				name = list.sample
				@skills.add_skill name, type, conf[type][1], 0
			end
		end

		@skills
	end

	SPADE = 1
	CLUB = 2
	HEART = 4
	DIA = 8

	def initialize(name,type,level,mark)
		@name = name
		@type = type
		@level = level
		@mark = 0
		if level == 1 && mark > 0
			@mark = mark
		else
			[level,4].min.times do
				inc_mark
			end
		end
	end

	attr_accessor :name,:type,:level

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
		mark_inspect + "〈" + type_inspect + @name + "〉" + @level.to_zen
	end
end