# encoding: utf-8

module Const
	ACTION = ["射撃","心理","自我","回避","操縦","白兵","圧力","信用"]

	BASIC = 0
	FEAT = 1
	MISTIQUE = 2
	ULTIMATE = 3

	LABELS = %w(理性 感情 生命 外界)
	KEYS = [:reason, :passion, :life, :mundane]
	IDS = [0,1,2,3]

	REASON	= 0
	PASSION	= 1
	LIFE	= 2
	MUNDANE	= 3
end