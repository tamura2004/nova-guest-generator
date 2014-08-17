# encoding: utf-8
require "csv"

module LoadCSV
	def table(filename)
		path = File.join(data_path, filename)
		CSV.table path, encoding: "BOM|UTF-8"
	end

	def each_row(filename)
		table(filename).each do |row|
			yield row.to_hash
		end
	end

	private

	def data_path
		File.expand_path("../../data",__FILE__)
	end
end