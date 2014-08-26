# encoding: utf-8
require_relative "ability"
require_relative "const"

class Abilities < S
	def initialize(guest)
		guest.styles.map{|s|STYLE_DATA[s.id].ability}.inject(:+).each_pair do |k,v|
			self[k] = v
		end
	end

	def each
		each_pair do |k,v|
			yield "#{ABILITY_LABELS[k]}：#{v.power}／#{v.control}"
		end
	end

	def cs
		(reason.power + passion.power + life.power)/2
	end
end

		# G[S[P[0,3],P[3,5],P[2,4],P[2,4]],"カブキ"],
		# G[S[P[3,5],P[2,5],P[1,3],P[1,3]],"バサラ"],
		# G[S[P[3,5],P[1,3],P[1,3],P[2,5]],"タタラ"],