# encoding: utf-8
class Age
	attr_accessor :unit, :age

	def initialize(guest)
		if guest.include?("アヤカシ")
			@unit = ["","万","億","兆"].sample
			@age = (rand(99)+1)*10
		else
			@unit = ""
			@age = rand(20)+14
		end
	end

	def to_s
		@age.to_s.tr("0-9","０-９") + @unit + "歳"
	end
end
