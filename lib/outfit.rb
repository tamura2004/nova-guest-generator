# encoding: utf-8

class Outfits < Array

	STYLE_MUSTBUY = {
		"アラシ" => [
			{type: "ウォーカー",minexp:10},
			{type: "搭載兵器",minexp:10}
		],
		"カゼ" => [
			{group: "ヴィークル"},
			{type: "搭載兵器"}
		],
		"カブトワリ" => [
			{type:"射撃武器",minexp:10}
		],
		"カタナ" => [
			{type: "白兵武器",minexp:10}
		],
		"ヒルコ" => [
			{type: "変異器官",minexp:5},
			{type: "変異器官",minexp:5},
		],
		"ニューロ" => [
			{type: "タップ",minexp:10},
			{type: "ソフトウェア",minexp:10},
			{type: "ソフトウェア",minexp:10}
		]
	}

	STYLE_REQUIRED = [
		["アラシ",:type,"ウォーカー"],
		["ヒルコ",:type,"変異器官"],
		["ニューロ",:group,"トロン"]
	]

	ORDER = %w(武器 防具 サイバーウェア ヴィークル トロン 生体装備 カルチャーウェア サービス 住居 その他)

	def initialize(guest)

		cost_total = 50
		STYLE_MUSTBUY.each_pair do |style,list|
			if guest.styles.include? style
				list.each do |item|
					item[:maxexp] = cost_total
					outfit = Outfit.new.generate(item)
					next if outfit.nil?
					cost_total -= outfit.exp
					self << outfit
				end
			end
		end

		while cost_total > 0
			outfit = Outfit.new.generate(minexp:(cost_total/4), maxexp:cost_total)
			break if outfit.nil?

			# 不適切なアウトフィットを除外
			flag = false
			STYLE_REQUIRED.each do |style,type,name|
				if guest.styles.include?(style) && outfit.send(type) == name
					flag = true
				end
			end
			next if flag

			cost_total -= outfit.exp
			self << outfit
		end

		sort_by!{|o|ORDER.index(o.group).to_s+o.type}
	end

	def groups;map(&:group);end
	def types;map(&:type);end
end

class Outfit

	NAME = 1

	# :id, :group, :type, :name, :exp, :rule, :page
	OUTFITS = CSV.table(File.expand_path("../../data/outfits.csv",__FILE__))

	def initialize
		@outfit = []
	end

	def generate(group: nil, type: nil, minexp: 5, maxexp: 30)
		list = OUTFITS
		list = list.select{|o|o[:group] == group} if group
		list = list.select{|o|o[:type] == type} if type
		list = list.select{|o|o[:exp] >= minexp} if minexp
		list = list.select{|o|o[:exp] <= maxexp} if maxexp
		list = OUTFITS.select{|o|o[:exp] <= 5} if list.empty?
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
	def nil?;@outfit.nil?;end

	def to_s
		"#{name}（#{rule}#{page}）exp:#{exp}"
	end

end
