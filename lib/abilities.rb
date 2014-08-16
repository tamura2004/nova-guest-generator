# encoding: utf-8
require_relative "ability.rb"

class Abilities < Array

	attr_reader :base, :styles

	def initialize(guest)
		guest.styles.map(&:ability).transpose.each_slice(2).with_index do |v,i|
			self << Ability.new(i,styles:v.transpose)
		end
	end

	def inc
		sort.first.inc
	end

	def cs
		self[0..2].map(&:power).inject(:+)/2
	end

	def exp
		map(&:exp).inject(:+)
	end

end
