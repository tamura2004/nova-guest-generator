# encoding: utf-8

# トランプのマークの on/off
class Mark < Hash

	def initialize(reason: false, passion: false, life: false, mundane: false)
		self[:reason] = reason
		self[:passion] = passion
		self[:life] = life
		self[:mundane] = mundane
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
		values.map(&method(:to_mark)).join
	end

	def level
		marked.size
	end

	private

	def marked
		keys.select(&method(:[]))
	end

	def unmarked
		keys - marked
	end

	def to_mark(boolean)
		boolean ? "●" : "○"
	end
end
