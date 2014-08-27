# encoding: utf-8

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
	end

	S = Suit
end
