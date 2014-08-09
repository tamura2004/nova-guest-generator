# encoding: utf-8

class Outfit

	NAME = 1

	# :id, :group, :type, :name, :exp, :rule, :page
	OUTFITS = CSV.table("outfits.csv")
	# p OUTFITS.sort_by{|e|e[:id]}.map{|e|e[:group]}.uniq

	ORDER = %w(武器 防具 サイバーウェア ヴィークル トロン 生体装備 カルチャーウェア サービス 住居 その他)

	STYLE_MUSTBUY = {
		"アラシ" => [
			{type: "ウォーカー",minexp:20},
			{type: "搭載兵器",minexp:20}
		],
		"カゼ" => [
			{group: "ヴィークル"},
			{type: "搭載兵器"}
		],
		"カブトワリ" => [
			{type:"射撃武器",minexp:20}
		],
		"カタナ" => [
			{type: "白兵武器",minexp:20}
		],
		"ニューロ" => [
			{type: "タップ",minexp:10},
			{type: "ソフトウェア",minexp:10},
			{type: "ソフトウェア",minexp:10}
		]

	}

	def self.generate(styles)
		cost_total = 70
		style_names = styles.map{|e|e[NAME]}
		outfits = []
		STYLE_MUSTBUY.each_pair do |style,list|
			if style_names.include? style
				list.each do |item|
					outfit = Outfit.new.generate(item)
					cost_total -= outfit.exp
					outfits << outfit
				end
			end
		end

		while cost_total > 0
			outfit = Outfit.new.generate(minexp:(cost_total/4), maxexp:cost_total)
			cost_total -= outfit.exp
			outfits << outfit
		end

		def outfits.inspect
			sort_by{|o|ORDER.index(o.group)}
		end

		outfits
	end

	def initialize
		@outfit = []
	end

	def generate(group: nil, type: nil, minexp: 5, maxexp: 50)
		list = OUTFITS
		list = list.select{|o|o[:group] == group} if group
		list = list.select{|o|o[:type] == type} if type
		list = list.select{|o|o[:exp] >= minexp} if minexp
		list = list.select{|o|o[:exp] <= maxexp} if maxexp
		raise "empty!" if list.empty?
		@outfit = list[rand(list.size)]
		self
	end

	def id;@outfit[:id];end
	def name;@outfit[:name];end
	def group;@outfit[:group];end
	def type;@outfit[:type];end
	def rule;@outfit[:rule];end
	def page;@outfit[:page];end
	def exp;@outfit[:exp];end

	def inspect
		"#{name}（#{rule}#{page}）exp:#{exp}"
	end

end
