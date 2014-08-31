# encoding: utf-8

pdf.font "./font/ipag.ttf"

Black = "000000"
White = "FFFFFF"

Guests = @guests

pdf.instance_eval do
	font_size 6
	define_grid columns:3, rows:3, gutter:5

	# デフォルトのセルスタイル
	cs = {
		height: 8,
		padding: 1,
		border_width: 0.25,
	}

	# デフォルトのヘッダ（白黒反転）スタイル
	hs = cs.merge({
		background_color: Black,
		text_color: White,
	})

	# センタリング
	center = {align: :center}

	# デフォルト＋センタリング
	ccs = cs.merge center

	# ヘッダ＋センタリング
	hcs = hs.merge center

	Guests.each_with_index do |guest,i|
		grid(i%3,i/3).bounding_box do
			#stroke_axis step_length: 10
			# fill_rectangle [bounds.left+5,bounds.top-5], bounds.width-10, 20
			# text "スタイル", color: "FFFFFF"
			stroke_bounds
			move_down 4
			indent 5,5 do
				table([["#{guest.organization}　#{guest.name.gender}　#{guest.age}"]],
					width: bounds.width,
					cell_style: hs.merge(
						height: 6,
						padding: [1,0,0,1],
						size: 4
						)
					)

				table([[guest.name.to_s]],
					width: bounds.width,
					cell_style: hs.merge(
						height: 7,
						padding: [0,0,1,2],
						)
					)

				table(
					[guest.styles.map(&:to_s)],
					width: bounds.width,
					cell_style:ccs
					)

				move_down 4

				w = bounds.width/9
				aws = [w*2,w*2,w*2,w*2,w]
				table(
					[["理性","感情","生命","外界","CS"]],
					width: bounds.width,
					column_widths: aws,
					cell_style: hcs
					)

				table(
					[guest.abilities.to_a + [guest.abilities.cs]],
					width: bounds.width,
					column_widths: aws,
					cell_style:ccs
					)

				move_down 4

				w = bounds.width/6
				sws = [w,w,w,w]
				table(
					[
						["技能","レベル","技能","レベル"]
					],
					width: bounds.width*2/3,
					column_widths: sws,
					cell_style: hs
					)
				bs = guest.skills.basic
				names = 12.times.map do |j|
					bs[j] ? bs[j].type.to_s + bs[j].name : ""
				end
				levels = 12.times.map do |j|
					bs[j] ? "#{bs[j].mark}" : ""
				end
				table(
					6.times.map{|j|
						[names[j],levels[j],names[j+6],levels[j+6]]
					},
					width: bounds.width*2/3,
					column_widths: sws,
					cell_style: cs
					)
				move_down 4

				w = bounds.width/12
				fws = [w*7,w*3,w*2]
				table(
					[["特技/秘技/奥義","レベル","ルール"]],
					width: bounds.width,
					column_widths: fws,
					cell_style: hs
					)

				ss = guest.skills.not_basic
				names = 6.times.map do |j|
					ss[j] ? "#{ss[j].type}#{ss[j].name}" : ""
				end
				levels = 6.times.map do |j|
					ss[j] ? "(#{ss[j].level})#{ss[j].mark}" : ""
				end
				rules = 6.times.map do |j|
					ss[j] ? "#{ss[j].rule.rule}#{ss[j].rule.page}" : ""
				end

				table(
					6.times.map{|j|
						[names[j],levels[j],rules[j]]
					},
					width: bounds.width,
					column_widths: fws,
					cell_style: cs
					)
				move_down 4

				w = bounds.width/12
				ows = [w*2,w*3,w*4,w*2,w*1]
				table(
					[["種類","分類","アウトフィット","ルール","exp"]],
					width: bounds.width,
					column_widths: ows,
					cell_style: hs
					)

				outfits = guest.outfits.map do |o|
					[
						o.group,
						o.type,
						o.name,
						"#{o.rule}#{o.page}",
						o.exp.to_s
					]
				end

				(7 - outfits.size).times do
					outfits << ["","","","",""]
				end

				table(
					outfits[0,7],
					width: bounds.width,
					column_widths: ows,
					cell_style: cs
					)
				image "public/#{guest.face}", at: [116,188]
			end
		end
	end
end