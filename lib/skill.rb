# encoding: utf-8
require_relative "mark"
require_relative "type"

class Skill < Struct.new(:rule,:level,:type,:mark)
	def initialize(rule)
		self.rule = rule

		self.mark = Mark.new(rule.mark)
		self.level = rule.mark ? 1 : 0
		self.type = Type.new(rule)
	end

	def inc!
		self.level += 1
		mark.inc!
		self
	end

	def add!(n)
		n.times{inc!}
		self
	end

	# 全体表示用
	def to_s
		"#{mark}〈#{type}#{name}〉#{to_zen(level)}" +
		(type != Type::BASIC ? "（#{rule.rule}#{rule.page}）" : "")
	end

	def to_hash
		@options
	end

	def name
		rule.name
	end

	private

	def to_zen(i)
		i.to_s.tr("0-9","０-９")
	end
end
