# encoding: utf-8
require "yaml"
require "erb"
require "csv"

require "./name.rb"
require "./skill.rb"
require "./outfit.rb"

RULES = YAML.load(open "guest_styles.yaml","r:utf-8")
TEMPLATE = open("guest_generator.erb","r:utf-8").read

BASE_SKILLS = ["射撃","心理","自我","回避","操縦","白兵","圧力","信用"]

ORGANIZATIONS = ["軌道千早","イワサキ・グループ","テラウェア","ヘイロン","ＣＦＣ","セフィロト","カーライル","川渡連合","三合会","NOVA軍","氷の静謐","フェスラー公国","ヒラサカ","ＢＩＯＳ","トライアンフ","ミカヅチ部隊","羅生門","岩崎御庭番集","ナンバーズ","マーダー・インク","魔会","キャノンボール","真教浄化派","真教浄化派","真教浄化派","真教浄化派","フリーランス","フリーランス","フリーランス"]

class Fixnum
	def to_zen
		to_s.tr("0-9","０-９")
	end
end

class CSV::Table
	def sample
		self[rand(self.size)]
	end
end

class Guest
	ID = 0
	NAME = 1
	ABILITY = 2
	SKILL = 3

	ORDINAL = 0
	FEAT = 1
	MISTIQUE = 2
	ULTIMATE = 3

	ABILITY_LABEL = %w(理性 感情 生命 外界)

	def initialize
		@handle = ""
		@gender = ""
		@organization = ""
		@name = ""
		@style_names = [nil,nil,nil]
		@key = 0
		@parsona = 0
		@ability = [0,0,0,0,0,0,0,0]
		@skills = []
		@outfits = []
	end

	def generate
		# パーソナリティ
		@name = Name.new
		@organization = ORGANIZATIONS.sample

		# スタイル
		@styles = Array.new(3){RULES.sample}
		@style_names = @styles.map{|e|e[NAME]}
		@key = rand(3)
		@parsona = rand(3)

		# 年齢
		@age = rand(20)+14
		@age **= (rand(5)+1) if @style_names.include?("アヤカシ")

		# 能力値
		@ability = [0,0,0,0,0,0,0,0]
		#@ability[[0,2,4,6].sample] = 1 # bonus
		@styles.each do |style|
			add_ability style[ABILITY]
		end

		@skills = Skill.generate(@styles)
		@outfits = Outfit.generate(@styles)
		self
	end

	def add_ability(ary)
		raise "err" if ary.size != 8
		@ability.each_with_index do |v,i|
			@ability[i] += ary[i]
		end
	end

	def age_inspect
		@age.to_zen + "歳"
	end

	def style_name_inspect
		@style_names[@key] = "●" + @style_names[@key]
		@style_names[@parsona] = "◎" + @style_names[@parsona]
		@style_names.join(" ＝ ")
	end

	def ability_inspect
		zen_ability = @ability.map{|e|e.to_s.tr("0-9","０-９")}
		zen_ability = zen_ability.each_slice(2).to_a.map{|e|e[0]+"／"+e[1]}
		ABILITY_LABEL.zip(zen_ability).map{|e|e[0]+"："+e[1]}
	end

	# 細かいところはSkillクラスに委譲
	def skills
		@skills.sort_by!{|e|e.type}
	end

	def inspect
		ERB.new(TEMPLATE,nil,"<>").result(binding)
	end
end

puts Guest.new.generate.inspect
