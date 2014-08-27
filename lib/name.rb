# encoding: utf-8

require File.expand_path("../name_constant.rb",__FILE__)

class Name
	include NameConstant

	attr_accessor :handle, :jname, :ename, :gender, :myoji

	def initialize
		change
	end

	def change
		change_gender
		change_handle
		change_myoji
		change_jname
		change_ename
		@rand = rand(4)
	end

	def change_gender
		@gender = case @gender
		when "男性" then "女性"
		when "女性" then "男性"
		else rand < 0.4 ? "男性" : "女性"
		end
		change_ename
	end

	def change_handle
		@handle = HANDLE_BEFORE.sample + HANDLE_AFTER.sample
	end

	def change_myoji
		@myoji = case rand(3)
		when 0 then JAPAN_KANA_FAMILY_NAMES.sample
		when 1 then JAPAN_FAMILY_NAMES.sample
		else JUNIOR_WORDS.sample
		end
	end

	def change_jname
		case @gender
		when "男性"
			@jname = rand(3).zero? ? JAPAN_MALE_NAMES.sample : JAPAN_KANA_MALE_NAMES.sample

		when "女性"
			@jname = rand(3).zero? ? JAPAN_FEMALE_NAMES.sample : JAPAN_KANA_FEMALE_NAMES.sample
		end
	end

	def change_ename
		case @gender
		when "男性"
			@ename = change_mname
		when "女性"
			@ename = change_fname
		end
	end

	def change_fname
		@female_name = FEMELE_FIRST.sample + FEMELE_MIDDLE.sample +
		 FEMELE_LAST.sample
	end

	def change_mname
		@male_name =  MALE_FIRST.sample + MALE_MIDDLE.sample + MALE_LAST.sample
	end

	def to_s
		case @rand
		when 0 then "“#{handle}”　#{ename} #{myoji}"
		when 1 then "“#{handle}”　#{myoji} #{ename}"
		when 2 then "“#{handle}”　#{myoji} #{ename} #{jname}"
		when 3 then "“#{handle}”　#{ename} #{jname} "
		end
	end
end

puts Name.new.to_s if __FILE__ == $0