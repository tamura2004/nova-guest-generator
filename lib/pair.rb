# encoding: utf-8

class Pair
	attr_reader :power, :control

	def self.[](power,control)
		Pair.new(power,control)
	end

	def initialize(power, control)
		@power = power
		@control = control
	end

	def inc
		@power += 1
	end

	def +(other)
		Pair[power + other.power, control + other.control]
	end

end
