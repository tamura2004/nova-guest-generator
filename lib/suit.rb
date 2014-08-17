# encoding: utf-8

class Suit < Array

	# getter
	def reason()	self[0] end
	def passion()	self[1] end
	def life()		self[2] end
	def mundane()	self[3] end

	# setter
	def reason=(v)	self[0] = v end
	def passion=(v)	self[1] = v end
	def life=(v)	self[2] = v end
	def mundane=(v)	self[3] = v end
end

