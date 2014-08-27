require_relative "rule/styles"

class Style < Struct.new(:sym,:fixed,:key,:persona)
	def change
		return if fixed
		self.sym = (Rule::Styles::Syms - [sym]).sample
		self
	end

	def mark
		(key ? "●" : "") + (persona ? "◎" : "")
	end

	def to_s
		mark + name
	end

	def name
		Rule::Styles::Data[sym].name
	end

	def name=(name)
		self.sym = Rule::Styles.to_sym(name)
	end

	def ability
		Rule::Styles::Data[sym].ability
	end
end
