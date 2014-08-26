# encoding: utf-8
require_relative "pair"
require_relative "const"
include Const

class Ability

	attr_reader :id
	include Comparable

	def initialize(id,level:0,styles:[])
		@id = id
		@level = Pair[level,level]
		@styles = styles.map{|p,c|Pair[p,c]}
		@base = Pair[0,0]
	end

	[:power,:control].each do |method|
		define_method(method) do
			([@base,@level] + @styles).map(&method).inject(:+)
		end
	end

	def name
		LABELS[@id]
	end

	def exp
		20 * (@base.power + @base.control + over(power, 10) + over(control,16))
	end

	def inc
		@base.inc
	end

	def <=>(other)
		(other.power <=> power).nonzero? || id <=> other.id
	end

	def to_s
		"#{name}：#{power}／#{control}"
	end

	private

	def over(val,limit)
		val < limit ? 0 : val - limit
	end
end

	# STYLE_DATA = T[
	# 	G[S[P[0,3],P[3,5],P[2,4],P[2,4]],"カブキ"],
	# 	G[S[P[3,5],P[2,5],P[1,3],P[1,3]],"バサラ"],
	# 	G[S[P[3,5],P[1,3],P[1,3],P[2,5]],"タタラ"],
	# 	G[S[P[1,4],P[3,5],P[1,2],P[2,5]],"ミストレス"],
	# 	G[S[P[2,4],P[1,4],P[3,5],P[1,3]],"カブト"],
	# 	G[S[P[1,3],P[3,5],P[0,3],P[3,5]],"カリスマ"],
	# 	G[S[P[1,3],P[3,5],P[2,5],P[1,3]],"マネキン"],
	# 	G[S[P[2,5],P[1,3],P[2,4],P[2,4]],"カゼ"],
	# 	G[S[P[2,5],P[2,5],P[1,3],P[2,3]],"フェイト"],
	# 	G[S[P[1,3],P[2,5],P[1,3],P[3,5]],"クロマク"],
	# 	G[S[P[2,5],P[1,3],P[1,3],P[3,5]],"エグゼク"],
	# 	G[S[P[2,4],P[0,4],P[3,5],P[2,3]],"カタナ"],
	# 	G[S[P[3,5],P[0,4],P[3,5],P[1,2]],"クグツ"],
	# 	G[S[P[3,4],P[0,5],P[2,4],P[2,3]],"カゲ"],
	# 	G[S[P[2,5],P[2,5],P[3,5],P[0,1]],"チャクラ"],
	# 	G[S[P[2,4],P[2,4],P[2,4],P[1,4]],"レッガー"],
	# 	G[S[P[2,4],P[0,4],P[2,3],P[3,5]],"カブトワリ"],
	# 	G[S[P[2,5],P[2,5],P[0,1],P[3,5]],"ハイランダー"],
	# 	G[S[P[3,5],P[3,5],P[0,2],P[1,4]],"マヤカシ"],
	# 	G[S[P[2,5],P[3,5],P[1,3],P[1,3]],"トーキー"],
	# 	G[S[P[3,5],P[1,3],P[2,5],P[1,3]],"イヌ"],
	# 	G[S[P[3,5],P[2,5],P[0,1],P[2,5]],"ニューロ"],
	# 	G[S[P[1,3],P[3,5],P[3,5],P[0,3]],"ヒルコ"],
	# 	G[S[P[3,5],P[2,4],P[2,4],P[0,3]],"クロガネ"],
	# 	G[S[P[3,5],P[0,3],P[1,3],P[3,5]],"アラシ"],
	# 	G[S[P[2,4],P[3,5],P[2,4],P[0,3]],"カゲムシャ"],
	# 	G[S[P[0,5],P[1,5],P[3,2],P[3,4]],"アヤカシ"]
	# ]
	# STYLE_KEYS = STYLE_DATA.members

	# # アビリティデータ
	# ABILITY_LABELS = S["理性","感情","生命","外界"]
	# ABILITY_KEYS = ABILITY_LABELS.members
	# ABILITY_BASE = S[P[0,0],P[0,0],P[0,0],P[0,0]]