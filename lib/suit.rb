# encoding: utf-8

class Suit < Array
	class << self
		def keys
			[:reason, :passion, :life, :mundane]
		end
	end

	keys.each_with_index do |name,i|
		eval("#{name.to_s.upcase} = #{i}")

		instance_eval do
			define_method(name) do
				self[i]
			end
		end

		instance_eval do
			define_method("#{name}=") do |v|
				self[i] = v
			end
		end
	end
end

