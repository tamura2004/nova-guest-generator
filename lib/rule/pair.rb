# encoding: utf-8

module Rule
	class Pair < Struct.new(:power,:control)
		def +(other)
			Pair[
				self.power + other.power,
				self.control + other.control
			]
		end
	end

	P = Pair
end
