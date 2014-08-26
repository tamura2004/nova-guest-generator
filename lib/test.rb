# encoding: utf-8
require_relative "csv_loader"
include CSVLoader

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

index = {}
STYLE_DATA.each_pair do |k,v|
	index[v.name] = k
end

X = Struct.new(:style,:type,:name,:rule,:page)

CSVLoader::each_row("style_skills") do |row|
	puts "X[:#{index[row[:style]]},#{row[:type]},"+'"'+"#{row[:name]}"+'"'+",:#{row[:rule]},#{row[:page]}],"
end
