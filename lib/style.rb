# encoding: utf-8

class Styles < Array
	def initialize
		3.times { self << Style.new }
		self[rand(3)].key = true
		self[rand(3)].persona = true
	end

	def names
		map(&:name)
	end

	def marks
		map(&:mark)
	end

	def to_s
		map(&:to_s).join("＝")
	end
end

class Style

	LIST = YAML.load(open File.expand_path("../../data/guest_styles.yaml",__FILE__),"r:utf-8")

	attr_accessor :key, :persona

	def initialize(style_id=nil)
		if style_id
			@style = LIST[style_id]
		else
			@style = LIST.sample
		end
		@key = false
		@persona = false
	end

	def mark
		(key ? "●" : "") + (persona ? "◎" : "")
	end

	def to_s
		mark + name
	end

	def id;@style[0];end
	def name;@style[1];end
	def ability;@style[2];end
	def skill;@style[3];end

	def ordinal;skill[0];end
	def feat;skill[1];end
	def mistique;skill[2];end
	def ultimate;skill[3];end

end
