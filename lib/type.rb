# encoding: utf-8

class Type
	ACTION 		= %(射撃 心理 自我 回避 操縦 白兵 圧力 信用)

	BASIC 		= 0
	FEAT 		= 1
	MISTIQUE 	= 2
	ULTIMATE 	= 3

	def initialize(rule)
		@type = rule.type
		@name = rule.name
	end

	def to_s
		case @type
		when BASIC then ACTION.include?(@name) ? "★" : ""
		when MISTIQUE then "†"
		when ULTIMATE then "※"
		else ""
		end
	end

	def ==(other)
		@type == other
	end
end

