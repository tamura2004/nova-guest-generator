require_relative "named_hash"
require_relative "const"
include Const

class Style < Struct.new(:id,:fixed,:key,:persona)
	def change
		return if fixed
		self.id = (STYLE_KEYS - [id]).sample
		self
	end

	def mark
		(key ? "●" : "") + (persona ? "◎" : "")
	end

	def to_s
		mark + STYLE_DATA[id].name
	end
end

# class Style < NamedHash
# 	def initialize()
# 		reset
# 		super
# 	end

# 	def name
# 		STYLES[id] rescue ""
# 	end

# 	def name=(name)
# 		self[:id] = STYLES.index name
# 	end

# 	def reset
# 		return if fixed
# 		self[:id] = ((0...STYLES.size).to_a - [id]).sample
# 	end

# 	def mark
# 		(key ? "●" : "") + (persona ? "◎" : "")
# 	end

# 	def to_s
# 		mark + name
# 	end
# end
