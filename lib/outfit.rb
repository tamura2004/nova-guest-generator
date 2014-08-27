# encoding: utf-8
require "csv"
require_relative "rule/outfits"

class Outfits < Array

	attr_accessor :exp,:not_own

	def initialize(guest)
		@guest = guest
		change
	end

	def include?(other)
		case other
		when Rule::Outfits::Buy
			any?{|o|o.group == other.group} ||
			any?{|o|o.type == other.type}
		else
			any?{|o|o.group == other} ||
			any?{|o|o.type == other}
		end
	end

	def mustbuy
		Rule::Outfits::Mustbuy.select do |buy|
			@guest.styles.any?{|s|s.sym == buy.style}
		end
	end

	def change
		clear
		@exp = 50
		@not_own = Rule::Outfits::Types

		# スタイル必須装備
		mustbuy.each do |buy|
			Outfit.new(buy,self)
		end

		# 全職業標準（武器防具）
		Rule::Outfits::Basics.each do |buy|
			Outfit.new(buy,self)
		end

		# 所持していない種類の装備を買う
		while 3 < @exp && !@not_own.empty?
			type = @not_own.sample
			buy = Rule::Outfits::Buy[nil,nil,type,0,@exp]
			Outfit.new(buy,self)
		end

		sort_by!{|o|Rule::Outfits::Groups.index(o.group).to_s + o.type}
	end
end

class Outfit < Rule::Outfit
	def initialize(buy,outfits)
		list = Rule::Outfits::Data.select do |outfit|
			(!buy.group || outfit.group == buy.group) &&
			(!buy.type || outfit.type == buy.type) &&
			(!buy.minexp || outfit.exp >= buy.minexp) &&
			(!buy.maxexp || outfit.exp <= buy.maxexp)
		end

		if list.empty?
			outfits.not_own - [buy.type] if buy.type
			return nil
		end

		super(*(list.sample))

		outfits.not_own -= [type]
		outfits << self

		outfits.exp -= exp

	end

	def to_s
		"#{name}（#{rule}#{page}）exp#{exp}"
	end

end
