# encoding: utf-8
require_relative "mark.rb"

class Skill < Hash

	BASE_SKILLS = ["射撃","心理","自我","回避","操縦","白兵","圧力","信用"]

	def initialize(name:,type:,level:,mark:,rule:,page:)
		self[:name] = name
		self[:type] = Type.new(type: type, name: name)
		self[:level] = level
		self[:mark] = Mark.new(mark).grow_upto!(level)
		self[:rule] = rule
		self[:page] = page
	end

	def inc!
		self[:level] += 1
		self[:mark].inc
		self
	end

	def add!(n)
		n.times{inc!}
		self
	end

	# 全体表示用
	def to_s
		if type == ORDINAL
			"#{mark_inspect}〈#{type_inspect}#{name}〉#{to_zen(level)}"
		else
			"#{mark_inspect}〈#{type_inspect}#{name}〉#{to_zen(level)}（#{rule}#{page}）"
		end
	end

	private

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

	def to_zen(i)
		i.to_s.tr("0-9","０-９")
	end
end

class Skill::Type
	def initialize(type:,name:nil)
		@type = type
		@name = name
	end

	def to_s
		case @type
		when :basic then BASE_SKILLS.include?(name) ? "★" : ""
		when :mistique then "†"
		when :ultimate then "※"
		end
	end
end