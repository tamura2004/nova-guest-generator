# encoding: utf-8

require "./name_constant.rb"

class Name
	include NameConstant

	def initialize
		change_gender
		change_handle
		change_jname
		change_ename
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

	def change_jname
		@jname = JNAME_BEFORE.sample + JNAME_AFTER.sample
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

	def inspect
		if rand < 0.4
			"“#{handle}”#{ename} #{jname}"
		else
			"“#{handle}”#{jname} #{ename}"
		end
	end

	attr_accessor :handle, :jname, :ename, :gender
end