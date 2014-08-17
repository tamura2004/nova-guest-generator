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

	LABELS 		= %w(理性 感情 生命 外界)
	KEYS 		= [:reason, :passion, :life, :mundane]
	IDS 		= [0,1,2,3]

	REASON		= 0
	PASSION		= 1
	LIFE		= 2
	MUNDANE		= 3

	STYLE_IDS = {
		'カブキ' => 0,
		'バサラ' => 1,
		'タタラ' => 2,
		'ミストレス' => 3,
		'カブト' => 4,
		'カリスマ' => 5,
		'マネキン' => 6,
		'カゼ' => 7,
		'フェイト' => 8,
		'クロマク' => 9,
		'エグゼク' => 10,
		'カタナ' => 11,
		'クグツ' => 12,
		'カゲ' => 13,
		'チャクラ' => 14,
		'レッガー' => 15,
		'カブトワリ' => 16,
		'ハイランダー' => 17,
		'マヤカシ' => 18,
		'トーキー' => 19,
		'イヌ' => 20,
		'ニューロ' => 21,
		'ヒルコ' => 22,
		'クロガネ' => 23,
		'アラシ' => 24,
		'カゲムシャ' => 25,
		'アヤカシ' => 26
	}

	STYLES = STYLE_IDS.keys
end