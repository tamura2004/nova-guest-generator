require "rubygems"
require "sinatra"
require "./guest_generator.rb"

get "/" do
	#attachment 'guest.txt'
	content_type 'text/plane'
	guest = Guest.new
	guest.generate.inspect
end

get "/download" do
	attachment 'guest.txt'
	content_type 'text/plane'
	guest = Guest.new
	guest.generate.inspect
end
