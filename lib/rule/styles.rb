# encoding: utf-8
require_relative "style"
require_relative "suit"
require_relative "pair"

module Rule
	class Styles < Struct.new(
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

		# class Style < Struct.new(:id,:key,:name,:ability)
		Data = self[
			Style[ 0,  :kabuki,			"カブキ",		S[P[0,3],P[3,5],P[2,4],P[2,4]]],
			Style[ 1,  :basara,			"バサラ",		S[P[3,5],P[2,5],P[1,3],P[1,3]]],
			Style[ 2,  :tatara,			"タタラ",		S[P[3,5],P[1,3],P[1,3],P[2,5]]],
			Style[ 3,  :mistress,		"ミストレス",	S[P[1,4],P[3,5],P[1,2],P[2,5]]],
			Style[ 4,  :kabuto,			"カブト",		S[P[2,4],P[1,4],P[3,5],P[1,3]]],
			Style[ 5,  :karisma,		"カリスマ",		S[P[1,3],P[3,5],P[0,3],P[3,5]]],
			Style[ 6,  :manekin,		"マネキン",		S[P[1,3],P[3,5],P[2,5],P[1,3]]],
			Style[ 7,  :kaze,			"カゼ",			S[P[2,5],P[1,3],P[2,4],P[2,4]]],
			Style[ 8,  :fate,			"フェイト",		S[P[2,5],P[2,5],P[1,3],P[2,3]]],
			Style[ 9,  :kuromaku,		"クロマク",		S[P[1,3],P[2,5],P[1,3],P[3,5]]],
			Style[ 10, :exec,			"エグゼク",		S[P[2,5],P[1,3],P[1,3],P[3,5]]],
			Style[ 11, :katana,			"カタナ",		S[P[2,4],P[0,4],P[3,5],P[2,3]]],
			Style[ 12, :kugutu,			"クグツ",		S[P[3,5],P[0,4],P[3,5],P[1,2]]],
			Style[ 13, :kage,			"カゲ",			S[P[3,4],P[0,5],P[2,4],P[2,3]]],
			Style[ 14, :chakra,			"チャクラ",		S[P[2,5],P[2,5],P[3,5],P[0,1]]],
			Style[ 15, :legger,			"レッガー",		S[P[2,4],P[2,4],P[2,4],P[1,4]]],
			Style[ 16, :kabutowari,		"カブトワリ",	S[P[2,4],P[0,4],P[2,3],P[3,5]]],
			Style[ 17, :highlander,		"ハイランダー",	S[P[2,5],P[2,5],P[0,1],P[3,5]]],
			Style[ 18, :mayakashi,		"マヤカシ",		S[P[3,5],P[3,5],P[0,2],P[1,4]]],
			Style[ 19, :talkie,			"トーキー",		S[P[2,5],P[3,5],P[1,3],P[1,3]]],
			Style[ 20, :inu,			"イヌ",			S[P[3,5],P[1,3],P[2,5],P[1,3]]],
			Style[ 21, :neuro,			"ニューロ",		S[P[3,5],P[2,5],P[0,1],P[2,5]]],
			Style[ 22, :hiruko,			"ヒルコ",		S[P[1,3],P[3,5],P[3,5],P[0,3]]],
			Style[ 23, :kurogane,		"クロガネ",		S[P[3,5],P[2,4],P[2,4],P[0,3]]],
			Style[ 24, :arashi,			"アラシ",		S[P[3,5],P[0,3],P[1,3],P[3,5]]],
			Style[ 25, :kagemusha,		"カゲムシャ",	S[P[2,4],P[3,5],P[2,4],P[0,3]]],
			Style[ 26, :ayakashi,		"アヤカシ",		S[P[0,5],P[1,5],P[3,2],P[3,4]]]
		]

		Syms = Data.members

		def self.to_sym(name)
			Data.find{|v|v.name == name}.sym
		end
	end
end
