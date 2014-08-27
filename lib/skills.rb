# encoding: utf-8
require_relative "skill"
require_relative "rule/skills"

class Skills < Array

	# 初期化
	def initialize(guest)
		@guest = guest
		change
	end

	# スキル取得設定
	CONFIG = [[5,1],[3,3],[2,2],[1,1]]

	def change
		clear

		# 無条件取得技能
		Rule::Skills::Basics.each do |skill|
			add Skill.new(skill)
		end

		# 追加取得技能
		CONFIG.each_with_index do |config,type|
			num, level = config

			num.times do
				a = my_skills(type)
				b = a.sample
				skill = Skill.new(b)
				skill.add!(level - skill.level)
				add(skill)
			end
		end
	end

	# 所持スタイルから取得可能な技能一覧
	def my_skills(type)
		Rule::Skills::Feats.select do |skill|
			@guest.include? skill.sym and skill.type == type
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
		select{|s|s.type == Type::BASIC}
	end

	def not_basic
		self - basic
	end
end