require "rubygems"
require "sinatra"
require "./lib/guest.rb"

get "/" do
	#attachment 'guest.txt'
	content_type 'text/plane'
	guest = Guest.new
	guest.inspect + "「トーキョーN◎VA The Axlerationは有限会社ファーイースト・アミューズメント・リサーチの著作物です」"
end

get "/download" do
	attachment 'guest.txt'
	content_type 'text/plane'
	guest = Guest.new
	guest.inspect
end
