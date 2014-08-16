# encoding: utf-8
require "csv"
require_relative "skill.rb"

class Skills < Array

	ORDINAL = 0
	FEAT = 1
	MISTIQUE = 2
	ULTIMATE = 3

	SETUP_SKILLS = [["射撃",1,1],["心理",1,2],["自我",1,2],["回避",1,4],["白兵",1,4],["圧力",1,8]]

	# :no, :style, :type, :name, :rule, :page
	STYLE_SKILLS = CSV.table(File.expand_path("../../data/style_skills.csv",__FILE__))

	def initialize(guest)
		SETUP_SKILLS.each do |skill|
			add_skill skill[0],ORDINAL,skill[1],skill[2],"TNA",120
		end

		config = [
			[[5,1],[3,3],[2,2],[1,1]]
		]

		[ORDINAL, FEAT, MISTIQUE, ULTIMATE].each do |type|
			list = STYLE_SKILLS.select{|s|s[:type]==type && guest.styles.include?(s[:style])}
			pattern = config.sample
			pattern[type][0].times do
				skill = list.sample
				add_skill skill[:name], type, pattern[type][1], 0, skill[:rule], skill[:page]
			end
		end
	end

	def add_skill(name,type,level,mark,rule,page)
		if i = index{|e|e.name == name}
			self[i].add_level level
		else
			self << Skill.new(name,type,level,mark,rule,page)
		end
	end

	def ordinal
		select{|s|s.type == ORDINAL}
	end

	def not_ordinal
		select{|s|s.type != ORDINAL}
	end
end