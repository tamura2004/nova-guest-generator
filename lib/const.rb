# encoding: utf-8
module Const
	ACTION 		= %(射撃 心理 自我 回避 操縦 白兵 圧力 信用)

	# 無条件取得技能
	DEFAULT		= [
		{name:"射撃",type:0,level:1,mark:{reason:true},rule:"TNA",page:120},
		{name:"心理",type:0,level:1,mark:{passion:true},rule:"TNA",page:120},
		{name:"自我",type:0,level:1,mark:{passion:true},rule:"TNA",page:120},
		{name:"回避",type:0,level:1,mark:{life:true},rule:"TNA",page:120},
		{name:"白兵",type:0,level:1,mark:{mundane:true},rule:"TNA",page:120},
		{name:"圧力",type:0,level:1,mark:{mundane:true},rule:"TNA",page:120}
	]

	BASIC 		= 0
	FEAT 		= 1
	MISTIQUE 	= 2
	ULTIMATE 	= 3

	# スキル取得設定
	CONFIG = [[5,1],[3,3],[2,2],[1,1]]

	KEYS 		= [:reason, :passion, :life, :mundane]
	IDS 		= [0,1,2,3]

	REASON		= 0
	PASSION		= 1
	LIFE		= 2
	MUNDANE		= 3

	# スタイルデータ
	T = Struct.new(
		:kabuki,
		:basara,
		:tatara,
		:mistress,
		:kabuto,
		:karisma,
		:manekin,
		:kaze,
		:fate,
		:kuromaku,
		:exec,
		:katana,
		:kugutu,
		:kage,
		:chakra,
		:legger,
		:kabutowari,
		:highlander,
		:mayakashi,
		:talkie,
		:inu,
		:neuro,
		:hiruko,
		:kurogane,
		:arashi,
		:kagemusha,
		:ayakashi
	)

	G = Struct.new(:ability,:name)

	S = Struct.new(:reason,:passion,:life,:mundane) do
		def +(other)
			S[
				reason + other.reason,
				passion + other.passion,
				life + other.life,
				mundane + other.mundane
			]
		end
	end

	P = Struct.new(:power,:control) do
		def +(other)
			P[
				power + other.power,
				control + other.control
			]
		end
	end

	STYLE_DATA = T[
		G[S[P[0,3],P[3,5],P[2,4],P[2,4]],"カブキ"],
		G[S[P[3,5],P[2,5],P[1,3],P[1,3]],"バサラ"],
		G[S[P[3,5],P[1,3],P[1,3],P[2,5]],"タタラ"],
		G[S[P[1,4],P[3,5],P[1,2],P[2,5]],"ミストレス"],
		G[S[P[2,4],P[1,4],P[3,5],P[1,3]],"カブト"],
		G[S[P[1,3],P[3,5],P[0,3],P[3,5]],"カリスマ"],
		G[S[P[1,3],P[3,5],P[2,5],P[1,3]],"マネキン"],
		G[S[P[2,5],P[1,3],P[2,4],P[2,4]],"カゼ"],
		G[S[P[2,5],P[2,5],P[1,3],P[2,3]],"フェイト"],
		G[S[P[1,3],P[2,5],P[1,3],P[3,5]],"クロマク"],
		G[S[P[2,5],P[1,3],P[1,3],P[3,5]],"エグゼク"],
		G[S[P[2,4],P[0,4],P[3,5],P[2,3]],"カタナ"],
		G[S[P[3,5],P[0,4],P[3,5],P[1,2]],"クグツ"],
		G[S[P[3,4],P[0,5],P[2,4],P[2,3]],"カゲ"],
		G[S[P[2,5],P[2,5],P[3,5],P[0,1]],"チャクラ"],
		G[S[P[2,4],P[2,4],P[2,4],P[1,4]],"レッガー"],
		G[S[P[2,4],P[0,4],P[2,3],P[3,5]],"カブトワリ"],
		G[S[P[2,5],P[2,5],P[0,1],P[3,5]],"ハイランダー"],
		G[S[P[3,5],P[3,5],P[0,2],P[1,4]],"マヤカシ"],
		G[S[P[2,5],P[3,5],P[1,3],P[1,3]],"トーキー"],
		G[S[P[3,5],P[1,3],P[2,5],P[1,3]],"イヌ"],
		G[S[P[3,5],P[2,5],P[0,1],P[2,5]],"ニューロ"],
		G[S[P[1,3],P[3,5],P[3,5],P[0,3]],"ヒルコ"],
		G[S[P[3,5],P[2,4],P[2,4],P[0,3]],"クロガネ"],
		G[S[P[3,5],P[0,3],P[1,3],P[3,5]],"アラシ"],
		G[S[P[2,4],P[3,5],P[2,4],P[0,3]],"カゲムシャ"],
		G[S[P[0,5],P[1,5],P[3,2],P[3,4]],"アヤカシ"]
	]
	STYLE_KEYS = STYLE_DATA.members


	# アビリティデータ
	ABILITY_LABELS = S["理性","感情","生命","外界"]
	ABILITY_KEYS = ABILITY_LABELS.members
	ABILITY_BASE = S[P[0,0],P[0,0],P[0,0],P[0,0]]

end