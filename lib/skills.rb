# encoding: utf-8
require_relative "skill"
# require_relative "csv_loader"
require_relative "skill_data"
require_relative "const"

# include CSVLoader

class Skills < Array
	include Const

	# スキルデータ一覧
	# SKILLS = []
	# CSVLoader::each_row("style_skills") do |row|
	# 	SKILLS << Skill.new(row)
	# end

	# 初期化
	def initialize(guest)
		@guest = guest
		change
	end

	def change
		clear

		# 無条件取得技能
		DEFAULT.each do |skill| add Skill.new(skill) end

		# 追加取得技能
		CONFIG.each_with_index do |config,type|
			num, level = config

			num.times do
				a = my_skills(type)
				b = a.sample
				c = b.to_h
				skill = Skill.new(c)
				skill.add!(level)
				add(skill)
			end
		end
	end

	# 所持スタイルから取得可能な技能一覧
	def my_skills(type)
		SKILLS.select do |skill|
			@guest.styles.include? skill.style and skill.type == type
		end
	end

	def add(skill)
		find_by_name(skill).add!(skill.level) rescue self << skill
	end

	def find_by_name(other)
		find do |skill|
			skill.name == other.name
		end
	end

	def names
		map(&:name)
	end

	def basic
		select{|s|s.type == Const::BASIC}
	end

	def not_basic
		self - basic
	end
end