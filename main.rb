require "rubygems"
require "sinatra"
require "prawn"
require "sinatra/prawn"
require "sinatra/reloader" if development?
require "slim"
require "./lib/guest.rb"

set :prawn, {
	page_size: "A4",
	page_layout: :portrait,
	top_margin: 20,
	bottom_margin: 20,
	left_margin: 20,
	right_margin: 20,
	compress: true
}

name2id = {}
STYLE_DATA.each_pair do |k,v|
	name2id[v.name] = k
end

guests = Array.new(6){Guest.new}
config = %w(アラシ カタナ カブトワリ ニューロ ヒルコ アヤカシ)
config.each_with_index do |name,i|
	guests[i].styles[0].id = name2id[name]
end

get "/" do
	@guests = guests
	slim :index
end

get "/config" do
	@config = config
	# @styles = STYLES + %w(近接系 射撃系 ロボ乗り 精神攻撃 社会攻撃 支援系)
	@styles = STYLE_DATA.values.map(&:name)
	slim :config
end

get "/config/*/*" do |npc,style|
	npc = npc.to_i
	style = style.to_i

	config[npc] = STYLE_DATA[style].name
	guests[npc].styles[0].id = STYLE_KEYS[style]
	# guests[npc].skills.change
	# guests[npc].outifts.change
	redirect to("/config")
end

get "/reset" do
	guests = config.map{|s|Guest.new(s)}
	redirect to("/")
end

get "/guest/*/styles" do |i|
	guests[i.to_i].styles.change
	redirect to("/")
end

get "/guest/*/name" do |i|
	guests[i.to_i].name = Name.new
	redirect to("/")
end

get "/guest/*/age" do |i|
	guests[i.to_i].age.change
	redirect to("/")
end

get "/guest/*/organization" do |i|
	guests[i.to_i].organization.change
	redirect to("/")
end

get "/guest/*/skills" do |i|
	guests[i.to_i].skills.change
	redirect to("/")
end

get "/guest/*/outfits" do |i|
	guests[i.to_i].outfits.change
	redirect to("/")
end

get "/guest/*/gender" do |i|
	guests[i.to_i].name.change_gender
	redirect to("/")
end

get "/text" do
	content_type 'text/plane'
	guests.map(&:to_s).join("") + "「トーキョーN◎VA The Axlerationは有限会社ファーイースト・アミューズメント・リサーチの著作物です」"
end

get "/pdf" do
	@guests = guests
	content_type 'application/pdf'
	prawn :pdf
end

# __END__

# @@ pdf
# pdf.font "./font/ipag.ttf"

# pdf.bounding_box([0,720],width:540,height:15) do
# 	pdf.font_size = 12
# 	pdf.stroke_bounds
# 	pdf.text "ゲストデータ", align: :center
# end

# 3.times do |x|
# 	2.times do |y|
# 		pdf.bounding_box([x*180, 705-y*350],width:180,height:350) do
# 			pdf.font_size = 6
# 			pdf.stroke_bounds
# 			pdf.text_box @guests[x*2+y].to_s,at:[10,345],width:160, height:345
# 		end
# 	end
# end

