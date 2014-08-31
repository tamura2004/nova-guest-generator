require "rubygems"
require "sinatra"
require "prawn"
require "prawn/table"
require "sinatra/prawn"
require "sinatra/reloader" if development?
require "slim"
require "./lib/guests"

set :prawn, {
	page_size: "A4",
	page_layout: :portrait,
	top_margin: 20,
	bottom_margin: 20,
	left_margin: 20,
	right_margin: 20,
	compress: true
}

guests = Guests.new

get "/" do
	@guests = guests
	slim :index
end

get "/config" do
	@config = guests.config
	# @styles = STYLES + %w(近接系 射撃系 ロボ乗り 精神攻撃 社会攻撃 支援系)
	@styles = Rule::Styles::Names
	slim :config
end

get "/config/*/*" do |npc,style|
	npc = npc.to_i
	style = style.to_i

	name = Rule::Styles::Data[style].name
	guests.config[npc] = name
	guests[npc].styles[0].name = name
	guests[npc].skills.change
	guests[npc].outfits.change

	redirect to("/config")
end

get "/reset" do
	guests = Guests.new
	redirect to("/")
end

get "/guest/*/styles" do |i|
	i = i.to_i
	guests[i].styles.change
	guests[i].skills.change
	guests[i].outfits.change
	guests[i].age.change
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

get "/card" do
	@guests = guests
	content_type 'application/pdf'
	prawn :card
end
