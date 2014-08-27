# encoding: utf-8
# require_relative "pair"

module Rule
	class Suit < Struct.new(:reason,:passion,:life,:mundane)
		def +(other)
			Suit[
				reason	+ other.reason,
				passion	+ other.passion,
				life	+ other.life,
				mundane	+ other.mundane
			]
		end

		# def set(other)
		# 	self.reason		= other.reason
		# 	self.passion	= other.passion
		# 	self.life		= other.life
		# 	self.mundane	= other.mundane
		# 	self
		# end

		# Base = self[Pair[0,0],Pair[0,0],Pair[0,0],Pair[0,0]]
	end

	S = Suit
end
