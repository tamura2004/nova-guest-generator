require "yaml"

RULES = YAML.load(open "guest_styles.yaml","r:utf-8")
outfile = open("style_skills.csv","w")

RULES.each do |style|
	style_no = style[0]
	style_name = style[1]

	#skills
	style[3].each_with_index do |skills,i|
		skills.each do |skill_name|
			outfile.puts [style_no,style_name,i,skill_name].join(",")
		end
	end
end

outfile.close
