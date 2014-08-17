# encoding: utf-8
require_relative "pair"

class Ability

	attr_reader :id
	include Comparable


	def initialize(id,level:0,styles:[])
		@id = id
		@level = Pair[level,level]
		@styles = styles.map{|p,c|Pair[p,c]}
		@base = Pair[0,0]
	end

	[:power,:control].each do |method|
		define_method(method) do
			([@base,@level] + @styles).map(&method).inject(:+)
		end
	end

	def name
		LABELS[@id]
	end

	def exp
		20 * (@base.power + @base.control + over(power, 10) + over(control,16))
	end

	def inc
		@base.inc
	end

	def <=>(other)
		(other.power <=> power).nonzero? || id <=> other.id
	end

	def to_s
		"#{name}：#{power}／#{control}"
	end

	private

	def over(val,limit)
		val < limit ? 0 : val - limit
	end
end
