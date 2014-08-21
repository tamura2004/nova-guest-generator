# encoding: utf-8
require "yaml"
require "erb"
require "csv"

require_relative "name"
require_relative "organization"
require_relative "style"
require_relative "age"
require_relative "abilities"
require_relative "skills"
require_relative "outfit"

TEMPLATE = open(File.expand_path("../../views/guest_generator.erb",__FILE__),"r:utf-8").read

class Guest

	attr_accessor :name
	attr_accessor :organization
	attr_accessor :age
	attr_accessor :styles
	attr_accessor :abilities
	attr_accessor :skills
	attr_accessor :outfits
	attr_accessor :style_id

	def initialize(style_id)
		@style_id = style_id
		@name = Name.new
		@organization = Organization.new
		@styles = Styles.new
		if @style_id > 5
			@styles[0] = Style.new(@style_id-6)
		end

		@age = Age.new(self)
		@abilities = Abilities.new(self)
		@skills = Skills.new(self)
		@outfits = Outfits.new(self)
	end

	def styles_change
		@styles = Styles.new
		if @style_id > 5
			@styles[0] = Style.new(@style_id-6)
		end

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
