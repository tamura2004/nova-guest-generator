# encoding: utf-8
# require_relative "suit"
require_relative "rule/suit"
# include Const

# トランプのマークの on/off
class Mark < Rule::Suit
	def initialize(key)
		key && self[key] = true
	end

	def inc!
		return if unmarked.empty?
		self[unmarked.sample] = true
		self
	end

	def add!(n)
		n.times{inc!}
		self
	end

	def grow_upto!(limit)
		add!(limit-level)
	end

	def to_s
		map(&method(:to_mark)).join
	end

	def level
		marked.size
	end

	private

	def marked
		members.select(&method(:[]))
	end

	def unmarked
		members - marked
	end

	def to_mark(boolean)
		boolean ? "■" : "○"
	end
end
