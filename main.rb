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

guests = Array.new(6){Guest.new}

# get "/guest/*" do |id|
# 	guests[id.to_i] = Guest.new
# 	redirect to("/slim")
# end

get "/reset" do
	guests = Array.new(6){Guest.new}
	redirect to("/slim")
end

get "/guest/*/styles" do |i|
	guests[i.to_i].styles_change
	redirect to("/slim")
end

get "/guest/*/name" do |i|
	guests[i.to_i].name = Name.new
	redirect to("/slim")
end

get "/guest/*/age" do |i|
	guests[i.to_i].age = Age.new(guests[i.to_i])
	redirect to("/slim")
end

get "/guest/*/organization" do |i|
	guests[i.to_i].organization = Organization.new
	redirect to("/slim")
end

get "/guest/*/skills" do |i|
	guests[i.to_i].skills = Skills.new(guests[i.to_i])
	redirect to("/slim")
end

get "/guest/*/outfits" do |i|
	guests[i.to_i].outfits = Outfits.new(guests[i.to_i])
	redirect to("/slim")
end

get "/guest/*/gender" do |i|
	guests[i.to_i].name.change_gender
	redirect to("/slim")
end

get "/" do
	content_type 'text/plane'
	guests.map(&:to_s).join("") + "「トーキョーN◎VA The Axlerationは有限会社ファーイースト・アミューズメント・リサーチの著作物です」"
end

get "/slim" do
	@guests = guests
	slim :index
end

get "/pdf" do
	@guests = guests
	content_type 'application/pdf'
	prawn :pdf
end

get "/download" do
	attachment 'guest.txt'
	content_type 'text/plane'
	guest = Guest.new
	guest.to_s
end

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

