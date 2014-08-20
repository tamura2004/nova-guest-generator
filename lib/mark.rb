# encoding: utf-8
require_relative "suit"
require_relative "const"
include Const

# トランプのマークの on/off
class Mark < Suit

	def initialize(reason: false, passion: false, life: false, mundane: false)
		insert(0,reason,passion,life,mundane)
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
		Const::IDS.select(&method(:[]))
	end

	def unmarked
		IDS - marked
	end

	def to_mark(boolean)
		boolean ? "■" : "○"
	end
end
