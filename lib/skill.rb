# encoding: utf-8
require_relative "const"
require_relative "mark"

class Skill
	attr_accessor :name,:type,:level,:mark,:rule,:page

	def initialize(name:,type:,level:,mark:,rule:,page:)
		@name = name
		@type = Type.new(type: type, name: name)
		@level = level
		@mark = Mark.new(mark).grow_upto!(level)
		@rule = rule
		@page = page
	end

	def inc!
		level += 1
		mark.inc
		self
	end

	def add!(n)
		n.times{inc!}
		self
	end

	# 全体表示用
	def to_s
		"#{mark}〈#{type}#{name}〉#{to_zen(level)}（#{rule}#{page}）"
	end

	private

	def to_zen(i)
		i.to_s.tr("0-9","０-９")
	end
end

class Skill::Type
	include Const

	def initialize(type:,name:nil)
		@type = type
		@name = name
	end

	def to_s
		case @type
		when BASIC then ACTION.include?(@name) ? "★" : ""
		when MISTIQUE then "†"
		when ULTIMATE then "※"
		end
	end
end