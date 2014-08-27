# encoding: utf-8
require "csv"

module CSVLoader
	def self.table(filename)
		filename += ".csv" if filename !~ /¥.csv$/
		path = File.join(data_path, filename)
		CSV.table path, encoding: "BOM|UTF-8"
	end

	def self.each_row(filename)
		table(filename).each do |row|
			yield row.to_hash
		end
	end

	private

	def self.data_path
		File.expand_path("../../data",__FILE__)
	end
end

# usage:
# require "csv_loader"
# class Skill
# 	def initialize
# 		CSVLoader::each_row "style_skills" do |row|
# 			puts row[:name]
# 		end
# 	end
# end
