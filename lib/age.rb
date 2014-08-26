# encoding: utf-8
require_relative "named_hash"

class Age < NamedHash
	def initialize(styles)
		@styles = styles
		reset
		super()
	end

	def reset
		if @styles.include?("アヤカシ")
			self[:unit] = ["","万","億","兆"].sample
			self[:age] = (rand(99)+1)*10
		else
			self[:unit] = ""
			self[:age] = rand(20)+14
		end
	end

	def to_s
		age.to_s.tr("0-9","０-９") + unit + "歳"
	end
end
