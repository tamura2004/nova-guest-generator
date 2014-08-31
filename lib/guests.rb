# encoding: utf-8
require_relative "guest"

class Guests < Array
	attr_accessor :config

	def initialize
		@config = %w(アラシ カタナ カブトワリ アラシ カタナ カブトワリ ニューロ ヒルコ アヤカシ)
		change
	end

	def change
		clear
		9.times do |i|
			self << Guest.new.tap do |guest|
				guest.styles[0].name = config[i]
				guest.skills.change
				guest.outfits.change
			end
		end
		self
	end
end

