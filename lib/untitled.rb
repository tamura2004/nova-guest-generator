require "yaml"

LIST = YAML.load(open File.expand_path("../../data/guest_styles.yaml",__FILE__),"r:utf-8")

LIST.each do |id,name,abilities,skill|
	rp,rc,pp,pc,lp,lc,mp,mc = abilities
	puts "[[#{rp},#{pp},#{lp},#{mp}],[#{rc},#{pc},#{lc},#{mc}]],"
end