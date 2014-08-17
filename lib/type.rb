# encoding: utf-8
require_relative "const"

class Type
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
		else ""
		end
	end

	def ==(other)
		@type == other
	end
end

