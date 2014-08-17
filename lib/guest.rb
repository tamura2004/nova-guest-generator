# encoding: utf-8
require "yaml"
require "erb"
require "csv"
require "pry"

require_relative "name"
require_relative "organization"
require_relative "style"
require_relative "age"
require_relative "abilities"
require_relative "skills"
require_relative "outfit"

TEMPLATE = open(File.expand_path("../../view/guest_generator.erb",__FILE__),"r:utf-8").read

class Guest

	attr_reader :name
	attr_reader :organization
	attr_reader :age
	attr_reader :styles
	attr_reader :abilities
	attr_reader :skills
	attr_reader :outfits

	def initialize
		@name = Name.new
		@organization = Organization.new
		@styles = Styles.new
		@age = Age.new(self)
		@abilities = Abilities.new(self)
		@skills = Skills.new(self)
		@outfits = Outfits.new(self)
	end

	def include?(name)
		# styles,outfit's type group, ordinal skill
		styles && styles.names.include?(name) ||
		outfits && outfits.groups.include?(name) ||
		outfits && outfits.types.include?(name) ||
		skills && skills.names.include?(name)
	end

	def to_s
		ERB.new(TEMPLATE,nil,"<>").result(binding)
	end
end

puts Guest.new.to_s if __FILE__ == $0
