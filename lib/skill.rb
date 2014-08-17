# encoding: utf-8
require_relative "mark"
require_relative "type"

class Skill
	attr_accessor :name,:type,:level,:mark,:rule,:page,:no,:style

	def initialize(name:,type:,level:0,mark:{},rule:,page:,no:nil,style:nil,**other)

		@options = { name:name,type:type,level:level,mark:mark,rule:rule,page:page,no:no,style:style }

		@name = name
		@type = Type.new(type: type, name: name)
		@level = level
		@mark = Mark.new(mark).grow_upto!(level)
		@rule = rule
		@page = page
		@no = no
		@style = style
	end

	def inc!
		@level += 1
		mark.inc!
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

	def to_hash
		@options
	end

	private

	def to_zen(i)
		i.to_s.tr("0-9","０-９")
	end
end
