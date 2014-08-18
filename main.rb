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

get "/" do
	content_type 'text/plane'
	guest = Guest.new
	guest.to_s + "「トーキョーN◎VA The Axlerationは有限会社ファーイースト・アミューズメント・リサーチの著作物です」"
end

get "/slim" do
	@guests = Array.new(6){Guest.new}
	slim :index
end

get "/pdf" do
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
			pdf.text_box Guest.new.to_s,at:[10,345],width:160, height:345
		end
	end
end

