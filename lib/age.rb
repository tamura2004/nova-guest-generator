# encoding: utf-8

class Age < Struct.new(:unit,:age)
	def initialize(guest)
		@guest = guest
		change
	end

	def change
		if @guest.include?("アヤカシ")
			self.unit = ["","万","億","兆"].sample
			self.age = (rand(99)+1)*10
		else
			self.unit = ""
			self.age = rand(20)+14
		end
	end

	def to_s
		age.to_s.tr("0-9","０-９") + unit + "歳"
	end
end
