# encoding: utf-8
require "erb"

require_relative "name"
require_relative "organization"
require_relative "styles"
require_relative "age"
require_relative "abilities"
require_relative "skills"
require_relative "outfit"

TEMPLATE = open(File.expand_path("../../views/guest_generator.erb",__FILE__),"r:utf-8").read


class Face < String
	def initialize
		change
	end

	def change
		clear
		self << ("face%02d.png" % rand(68))
	end
end

class Guest < Struct.new(:name,:face,:organization,:styles,:age,:abilities,:skills,:outfits)
	def initialize
		self.name			= Name.new
		self.face			= Face.new
		self.organization	= Organization.new
		self.styles			= Styles.new
		self.age			= Age.new(self)
		self.abilities		= Abilities.new(self)
		self.skills			= Skills.new(self)
		self.outfits		= Outfits.new(self)
	end

	def include?(name)
		# styles,outfit's type group, ordinal skill
		styles && styles.include?(name) ||
		outfits && outfits.include?(name) ||
		skills && skills.names.include?(name)
	end

	def to_s
		ERB.new(TEMPLATE,nil,"<>").result(binding)
	end
end

puts Guest.new.to_s if __FILE__ == $0
