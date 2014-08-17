[:reason, :passion, :life, :mundane].each_with_index do |name,i|
	puts("#{name.to_s.upcase} = #{i}")
end


[:reason, :passion, :life, :mundane].each_with_index do |name,i|
	puts "def #{name}() self[#{i}] end"
end

[:reason, :passion, :life, :mundane].each_with_index do |name,i|
	puts "def #{name}(v) self[#{i}] = v end"
end

keys = [:reason, :passion, :life, :mundane].map(&:upcase).join(",")

puts "KEYS = [#{keys}]"