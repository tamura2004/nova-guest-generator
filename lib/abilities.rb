# encoding: utf-8
require_relative "rule/styles"

class Abilities < Rule::Suit

	Label = Rule::Suit["理性","感情","生命","外界"]
	# Keys = Label.members

	def initialize(guest)
		@guest = guest
	end

	def suits
		@guest.styles[0].ability +
		@guest.styles[1].ability +
		@guest.styles[2].ability
	end

	def each
		suits.each_pair do |key,pair|
			yield "#{Label[key]}：#{pair.power}／#{pair.control}"
		end
	end

	def reason() suits.reason end
	def passion() suits.passion end
	def life() suits.life end
	def mundane() suits.mundane end

	def cs
		(reason.power + passion.power + life.power)/2
	end
end
