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

config = [12,17,25,5,22,0]
guests = config.map{|s|Guest.new(s)}

# get "/guest/*" do |id|
# 	guests[id.to_i] = Guest.new
# 	redirect to("/slim")
# end

get "/config" do
	@config = config
	@styles = %w(近接系 射撃系 ロボ乗り 精神攻撃 社会攻撃 支援系) + STYLES
	slim :config
end

get "/config/*/*" do |npc,style|
	config[npc.to_i] = style.to_i
	guests[npc.to_i].style_id = style.to_i
	redirect to("/config")
end

get "/reset" do
	guests = config.map{|s|Guest.new(s)}
	redirect to("/")
end

get "/guest/*/styles" do |i|
	guests[i.to_i].styles_change
	redirect to("/")
end

get "/guest/*/name" do |i|
	guests[i.to_i].name = Name.new
	redirect to("/")
end

get "/guest/*/age" do |i|
	guests[i.to_i].age = Age.new(guests[i.to_i])
	redirect to("/")
end

get "/guest/*/organization" do |i|
	guests[i.to_i].organization = Organization.new
	redirect to("/")
end

get "/guest/*/skills" do |i|
	guests[i.to_i].skills = Skills.new(guests[i.to_i])
	redirect to("/")
end

get "/guest/*/outfits" do |i|
	guests[i.to_i].outfits = Outfits.new(guests[i.to_i])
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

get "/" do
	@guests = guests
	slim :index
end

get "/pdf" do
	@guests = guests
	content_type 'application/pdf'
	prawn :pdf
end

# get "/download" do
# 	attachment 'guest.txt'
# 	content_type 'text/plane'
# 	guest = Guest.new
# 	guest.to_s
# end

__END__

@@ pdf
pdf.font "./font/ipag.ttf"

pdf.bounding_box([0,720],width:540,height:15) do
	pdf.font_size = 12
	pdf.stroke_bounds
	pdf.text "ゲストデータ", align: :center
end

3.times do |x|
	2.times do |y|
		pdf.bounding_box([x*180, 705-y*350],width:180,height:350) do
			pdf.font_size = 6
			pdf.stroke_bounds
			pdf.text_box @guests[x*2+y].to_s,at:[10,345],width:160, height:345
		end
	end
end

