# encoding: utf-8
require_relative "style"
require_relative "rule/styles"

class Styles < Array
	def initialize
		3.times { self << Style.new }
		change
	end

	def change
		each do |style|
			style.change
			style.key = false
			style.persona = false
		end

		self[rand(3)].key = true
		self[rand(3)].persona = true

		self
	end

	def include?(other)
		any? do |style|
			[style.name, style.sym].include? other
		end
	end

	def to_s
		map(&:to_s).join("＝")
	end
end