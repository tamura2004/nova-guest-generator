# encoding: utf-8

pdf.font "./font/ipag.ttf"

pdf.bounding_box([0,720],width:540,height:15) do
	pdf.font_size = 12
	pdf.stroke_bounds
	pdf.text "ゲストデータ", align: :center
end

3.times do |x|
	2.times do |y|
		pdf.bounding_box([x*180, 705-y*350],width:180,height:350) do
			pdf.font_size = 6
			pdf.stroke_bounds
			pdf.text_box @guests[x*2+y].to_s,at:[10,345],width:160, height:345
		end
	end
end
