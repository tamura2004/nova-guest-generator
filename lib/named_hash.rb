class NamedHash < Hash
	def initialize
		yield self if block_given?
	end

	def method_missing(m,*args)
		if has_key? m
			self[m]
		elsif m =~ /^(.*)=$/ && args.size == 1
			self[$1.to_sym] = args.first
		end
	end
end