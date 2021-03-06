# encoding: utf-8
X = Struct.new(:style,:type,:name,:rule,:page)

SKILLS = [
	X[:kabuki,0,"芸術",:TNA,120],
	X[:kabuki,0,"芸術",:TNA,120],
	X[:kabuki,1,"コミックヒーロー",:TNA,180],
	X[:kabuki,1,"挑発",:TNA,180],
	X[:kabuki,1,"ミリオンヒット",:TNA,180],
	X[:kabuki,1,"ラッキーストライク",:TNA,180],
	X[:kabuki,2,"カース",:TNA,181],
	X[:kabuki,2,"熱狂",:TNA,181],
	X[:kabuki,2,"ハードラック",:TNA,181],
	X[:kabuki,3,"アートバトル",:TNA,181],
	X[:basara,0,"自我",:TNA,120],
	X[:basara,1,"引き寄せ",:TNA,182],
	X[:basara,1,"強化",:TNA,182],
	X[:basara,1,"鋭刃",:TNA,182],
	X[:basara,1,"障壁",:TNA,182],
	X[:basara,1,"斥力",:TNA,182],
	X[:basara,1,"元力付与",:TNA,183],
	X[:basara,1,"強化元力",:TNA,183],
	X[:basara,1,"拘束",:TNA,183],
	X[:basara,2,"力学",:TNA,183],
	X[:basara,2,"拡大",:TNA,183],
	X[:basara,2,"加速",:TNA,183],
	X[:basara,2,"元力②：電磁（正）",:TNA,184],
	X[:basara,2,"元力②：電磁（負）",:TNA,184],
	X[:basara,2,"元力③：火炎（正）",:TNA,184],
	X[:basara,2,"元力③：火炎（負）",:TNA,184],
	X[:basara,2,"元力④：疾風（正）",:TNA,184],
	X[:basara,2,"元力④：疾風（負）",:TNA,184],
	X[:basara,2,"元力⑤：水雲（正）",:TNA,184],
	X[:basara,2,"元力⑤：水雲（負）",:TNA,184],
	X[:basara,2,"元力⑥：大地（正）",:TNA,184],
	X[:basara,2,"元力⑥：大地（負）",:TNA,184],
	X[:basara,2,"元力⑦：重力",:TNA,184],
	X[:basara,2,"元力⑧：器物",:TNA,184],
	X[:basara,2,"元力⑨：生物",:TNA,184],
	X[:basara,2,"元力⑩：虚無",:TNA,184],
	X[:basara,3,"中和",:TNA,183],
	X[:tatara,0,"医療",:TNA,120],
	X[:tatara,0,"制作",:TNA,120],
	X[:tatara,1,"改造",:TNA,186],
	X[:tatara,1,"パーソナルバリア",:TNA,186],
	X[:tatara,2,"加速装置",:TNA,187],
	X[:tatara,2,"アドバイス",:TNA,187],
	X[:tatara,2,"教授",:TNA,187],
	X[:tatara,2,"弱点看破",:TNA,187],
	X[:tatara,2,"爆破工作",:TNA,187],
	X[:tatara,2,"マキシマライズ",:TNA,187],
	X[:tatara,3,"タイムマジック",:TNA,187],
	X[:tatara,3,"ブレークダウン",:TNA,187],
	X[:tatara,3,"マニピュレーション",:TNA,187],
	X[:mistress,0,"交渉",:TNA,120],
	X[:mistress,1,"おしおき",:TNA,188],
	X[:mistress,1,"微笑のベール",:TNA,188],
	X[:mistress,2,"吉祥天",:TNA,189],
	X[:mistress,2,"鼓舞",:TNA,189],
	X[:mistress,2,"自己犠牲",:TNA,189],
	X[:mistress,2,"声援",:TNA,189],
	X[:mistress,2,"盾の乙女",:TNA,189],
	X[:mistress,2,"母性本能",:TNA,189],
	X[:mistress,3,"士気高揚",:TNA,189],
	X[:mistress,3,"勝利の女神",:TNA,189],
	X[:mistress,3,"女神の御手",:TNA,189],
	X[:kabuto,0,"回避",:TNA,120],
	X[:kabuto,1,"一心同体",:TNA,190],
	X[:kabuto,1,"金剛",:TNA,190],
	X[:kabuto,1,"鉄壁",:TNA,190],
	X[:kabuto,1,"仁王立ち",:TNA,190],
	X[:kabuto,1,"八面六臂",:TNA,190],
	X[:kabuto,1,"反射防御",:TNA,190],
	X[:kabuto,1,"不動",:TNA,190],
	X[:kabuto,1,"無敵防御",:TNA,190],
	X[:kabuto,1,"見えざる盾",:TNA,191],
	X[:kabuto,2,"撃ち返し",:TNA,191],
	X[:kabuto,2,"カバーリング",:TNA,191],
	X[:kabuto,2,"自動防御",:TNA,191],
	X[:kabuto,2,"八重垣",:TNA,191],
	X[:kabuto,3,"獅子心",:TNA,191],
	X[:kabuto,3,"ドレッドノート",:TNA,191],
	X[:kabuto,3,"フォーミダブル",:TNA,191],
	X[:karisma,0,"心理",:TNA,120],
	X[:karisma,1,"サブリミナル",:TNA,192],
	X[:karisma,1,"陣頭指揮",:TNA,192],
	X[:karisma,1,"聖戦",:TNA,192],
	X[:karisma,2,"狂信者",:TNA,193],
	X[:karisma,2,"ゲシュタルト崩壊",:TNA,193],
	X[:karisma,2,"サイコロジー",:TNA,193],
	X[:karisma,2,"叱咤激励",:TNA,193],
	X[:karisma,2,"集団催眠",:TNA,193],
	X[:karisma,3,"威厳",:TNA,193],
	X[:karisma,3,"洗脳",:TNA,193],
	X[:karisma,3,"免罪符",:TNA,193],
	X[:manekin,0,"心理",:TNA,120],
	X[:manekin,1,"大嫌い",:TNA,194],
	X[:manekin,1,"毒舌",:TNA,194],
	X[:manekin,2,"悪魔のささやき",:TNA,195],
	X[:manekin,2,"アドレナライズ",:TNA,195],
	X[:manekin,2,"破滅のささやき",:TNA,195],
	X[:manekin,2,"人使い",:TNA,195],
	X[:manekin,2,"魔女の呪い",:TNA,195],
	X[:manekin,3,"口答え",:TNA,195],
	X[:manekin,3,"ティアドロップ",:TNA,195],
	X[:manekin,3,"魔女の叫び",:TNA,195],
	X[:kaze,0,"操縦",:TNA,120],
	X[:kaze,0,"操縦",:TNA,120],
	X[:kaze,1,"曲芸飛行／走行",:TNA,196],
	X[:kaze,1,"バーンナウト",:TNA,196],
	X[:kaze,1,"ライドファイト",:TNA,196],
	X[:kaze,1,"ロケットスタート",:TNA,196],
	X[:kaze,2,"エキサイトバトル",:TNA,197],
	X[:kaze,2,"スーパーチャージャー",:TNA,197],
	X[:kaze,2,"ダイレクトロール",:TNA,197],
	X[:kaze,2,"チャージ",:TNA,197],
	X[:kaze,2,"ライトスピード",:TNA,197],
	X[:kaze,3,"カミカゼ",:TNA,197],
	X[:kaze,3,"スーパーソニック",:TNA,197],
	X[:kaze,3,"マルチアクション",:TNA,197],
	X[:fate,0,"知覚",:TNA,120],
	X[:fate,1,"警報",:TNA,198],
	X[:fate,1,"護身術",:TNA,198],
	X[:fate,1,"シャープアイ",:TNA,198],
	X[:fate,2,"信念の盾",:TNA,199],
	X[:fate,2,"サイコショック",:TNA,199],
	X[:fate,2,"ロングハンド",:TNA,199],
	X[:fate,3,"灰色の脳細胞",:TNA,199],
	X[:fate,3,"ミスリード",:TNA,199],
	X[:fate,3,"モノローグ",:TNA,199],
	X[:kuromaku,0,"信用",:TNA,120],
	X[:kuromaku,1,"影の謀略",:TNA,200],
	X[:kuromaku,1,"身代わり",:TNA,200],
	X[:kuromaku,2,"黒い陰謀",:TNA,201],
	X[:kuromaku,2,"帝王のオーラ",:TNA,201],
	X[:kuromaku,2,"天災",:TNA,201],
	X[:kuromaku,2,"ビッグオーダー",:TNA,201],
	X[:kuromaku,2,"ブラックマーケット",:TNA,201],
	X[:kuromaku,3,"吊し上げ",:TNA,201],
	X[:kuromaku,3,"帝王の力",:TNA,201],
	X[:kuromaku,3,"帝王の庭",:TNA,201],
	X[:exec,0,"圧力",:TNA,120],
	X[:exec,1,"運命の輪",:TNA,202],
	X[:exec,1,"機密情報",:TNA,202],
	X[:exec,1,"コレクティブ",:TNA,202],
	X[:exec,1,"産業スパイ",:TNA,202],
	X[:exec,1,"情報操作",:TNA,202],
	X[:exec,1,"ホットライン",:TNA,202],
	X[:exec,1,"レイオフ",:TNA,202],
	X[:exec,2,"企業の一撃",:TNA,203],
	X[:exec,2,"支援要請",:TNA,203],
	X[:exec,2,"試作品",:TNA,203],
	X[:exec,2,"デスマーチ",:TNA,203],
	X[:exec,2,"マネーパワー",:TNA,203],
	X[:exec,3,"アタッチメント",:TNA,203],
	X[:exec,3,"パワーゲーム",:TNA,203],
	X[:exec,3,"プレコーション",:TNA,203],
	X[:katana,0,"白兵",:TNA,120],
	X[:katana,0,"白兵",:TNA,120],
	X[:katana,1,"居合い",:TNA,204],
	X[:katana,1,"鬼の爪",:TNA,204],
	X[:katana,1,"カマイタチ",:TNA,204],
	X[:katana,1,"ハヤブサ",:TNA,204],
	X[:katana,1,"見切り",:TNA,204],
	X[:katana,1,"無風剣",:TNA,204],
	X[:katana,1,"無明剣",:TNA,204],
	X[:katana,1,"リフレクション",:TNA,204],
	X[:katana,2,"修羅",:TNA,205],
	X[:katana,2,"二刀流",:TNA,205],
	X[:katana,2,"斬裁剣",:TNA,205],
	X[:katana,2,"旋風撃",:TNA,205],
	X[:katana,2,"粉砕剣",:TNA,205],
	X[:katana,2,"峰打ち",:TNA,205],
	X[:katana,3,"影殺剣",:TNA,205],
	X[:katana,3,"突き返し",:TNA,205],
	X[:katana,3,"二天一流",:TNA,205],
	X[:kugutu,0,"社会（企業）",:TNA,120],
	X[:kugutu,1,"実験体",:TNA,206],
	X[:kugutu,1,"忠誠",:TNA,206],
	X[:kugutu,1,"マルチワーク",:TNA,206],
	X[:kugutu,2,"営業",:TNA,207],
	X[:kugutu,2,"強化手術",:TNA,207],
	X[:kugutu,2,"士道",:TNA,207],
	X[:kugutu,2,"製品知識",:TNA,207],
	X[:kugutu,2,"葉隠",:TNA,207],
	X[:kugutu,2,"バンザイ",:TNA,207],
	X[:kugutu,3,"献身",:TNA,207],
	X[:kugutu,3,"プレッシャー",:TNA,207],
	X[:kugutu,3,"リザレクション",:TNA,207],
	X[:kage,0,"隠密",:TNA,120],
	X[:kage,1,"霞斬り",:TNA,208],
	X[:kage,1,"胡蝶",:TNA,208],
	X[:kage,1,"飛刃",:TNA,208],
	X[:kage,1,"ベイルアウト",:TNA,208],
	X[:kage,1,"無面目",:TNA,208],
	X[:kage,2,"空蝉",:TNA,209],
	X[:kage,2,"完全奇襲",:TNA,209],
	X[:kage,2,"死点撃ち",:TNA,209],
	X[:kage,2,"地走り",:TNA,209],
	X[:kage,2,"毒術",:TNA,209],
	X[:kage,2,"フェイク",:TNA,209],
	X[:kage,3,"陽炎",:TNA,209],
	X[:kage,3,"分身",:TNA,209],
	X[:kage,3,"乱れ撃ち",:TNA,209],
	X[:chakra,0,"白兵",:TNA,120],
	X[:chakra,0,"白兵",:TNA,120],
	X[:chakra,1,"軽功",:TNA,210],
	X[:chakra,1,"縮地",:TNA,210],
	X[:chakra,1,"手刀",:TNA,210],
	X[:chakra,1,"心眼",:TNA,210],
	X[:chakra,1,"鉄身",:TNA,210],
	X[:chakra,1,"遠当",:TNA,210],
	X[:chakra,1,"刃乗り",:TNA,210],
	X[:chakra,1,"練気",:TNA,210],
	X[:chakra,2,"乾坤一擲",:TNA,211],
	X[:chakra,2,"功夫",:TNA,211],
	X[:chakra,2,"周天功",:TNA,211],
	X[:chakra,2,"鉄拳",:TNA,211],
	X[:chakra,2,"徹し",:TNA,211],
	X[:chakra,2,"ボディウォール",:TNA,211],
	X[:chakra,3,"点穴",:TNA,212],
	X[:chakra,3,"八卦",:TNA,212],
	X[:chakra,3,"纏気",:TNA,212],
	X[:legger,0,"射撃",:TNA,120],
	X[:legger,1,"威圧",:TNA,213],
	X[:legger,1,"イカサマ",:TNA,213],
	X[:legger,1,"鉄砲玉",:TNA,213],
	X[:legger,1,"手妻使い",:TNA,213],
	X[:legger,2,"追い打ち",:TNA,214],
	X[:legger,2,"追い込み",:TNA,214],
	X[:legger,2,"替え玉",:TNA,214],
	X[:legger,2,"急所攻撃",:TNA,214],
	X[:legger,2,"凶刃",:TNA,214],
	X[:legger,2,"ブラフ",:TNA,214],
	X[:legger,3,"ガン付け",:TNA,214],
	X[:legger,3,"口封じ",:TNA,214],
	X[:legger,3,"捨て身",:TNA,214],
	X[:kabutowari,0,"射撃",:TNA,120],
	X[:kabutowari,0,"射撃",:TNA,120],
	X[:kabutowari,1,"エイミング",:TNA,214],
	X[:kabutowari,1,"クイックドロー",:TNA,214],
	X[:kabutowari,1,"ガンフー",:TNA,214],
	X[:kabutowari,1,"シャープシューター",:TNA,214],
	X[:kabutowari,1,"貫きの矢",:TNA,214],
	X[:kabutowari,1,"跳弾",:TNA,214],
	X[:kabutowari,1,"背面撃ち",:TNA,214],
	X[:kabutowari,1,"ファニング",:TNA,214],
	X[:kabutowari,2,"インターセプト",:TNA,215],
	X[:kabutowari,2,"制圧射撃",:TNA,215],
	X[:kabutowari,2,"黒羽の矢",:TNA,215],
	X[:kabutowari,2,"花吹雪",:TNA,215],
	X[:kabutowari,2,"パリングショット",:TNA,215],
	X[:kabutowari,2,"必殺の矢",:TNA,215],
	X[:kabutowari,3,"禅銃",:TNA,215],
	X[:kabutowari,3,"ピンポイント",:TNA,215],
	X[:kabutowari,3,"流星雨",:TNA,215],
	X[:highlander,0,"射撃",:TNA,120],
	X[:highlander,1,"アテンション",:TNA,216],
	X[:highlander,1,"イノセント",:TNA,216],
	X[:highlander,1,"影の守り手",:TNA,216],
	X[:highlander,1,"後光",:TNA,216],
	X[:highlander,1,"天の恩寵",:TNA,216],
	X[:highlander,1,"ホログラム",:TNA,216],
	X[:highlander,2,"殺戮の天使",:TNA,217],
	X[:highlander,2,"守護天使",:TNA,217],
	X[:highlander,2,"身体記憶",:TNA,217],
	X[:highlander,2,"天の調律",:TNA,217],
	X[:highlander,2,"導きの羽",:TNA,217],
	X[:highlander,3,"救済の天使",:TNA,217],
	X[:highlander,3,"天上人",:TNA,217],
	X[:highlander,3,"封印記憶",:TNA,217],
	X[:mayakashi,0,"自我",:TNA,120],
	X[:mayakashi,1,"隠心",:TNA,218],
	X[:mayakashi,1,"恐怖",:TNA,218],
	X[:mayakashi,2,"幻覚",:TNA,219],
	X[:mayakashi,2,"封印",:TNA,219],
	X[:mayakashi,2,"消沈",:TNA,219],
	X[:mayakashi,2,"呪縛",:TNA,219],
	X[:mayakashi,2,"精神破砕",:TNA,219],
	X[:mayakashi,2,"精神庇護",:TNA,219],
	X[:mayakashi,3,"憑依",:TNA,219],
	X[:mayakashi,3,"儀式魔術",:TNA,219],
	X[:mayakashi,3,"消去",:TNA,219],
	X[:talkie,0,"心理",:TNA,120],
	X[:talkie,1,"決定的瞬間",:TNA,220],
	X[:talkie,1,"早口",:TNA,220],
	X[:talkie,1,"フォトジェニック",:TNA,220],
	X[:talkie,2,"緊急特番",:TNA,221],
	X[:talkie,2,"シャッターチャンス",:TNA,221],
	X[:talkie,2,"スクープ",:TNA,221],
	X[:talkie,2,"パパラッチ",:TNA,221],
	X[:talkie,2,"フラッシュフラッシュ",:TNA,221],
	X[:talkie,3,"ショウアップ",:TNA,221],
	X[:talkie,3,"生還",:TNA,221],
	X[:inu,0,"射撃",:TNA,120],
	X[:inu,1,"緊急回避",:TNA,222],
	X[:inu,1,"即応態勢",:TNA,222],
	X[:inu,1,"捕縛術",:TNA,222],
	X[:inu,2,"拘束術",:TNA,223],
	X[:inu,2,"集団退避",:TNA,223],
	X[:inu,2,"締め上げ",:TNA,223],
	X[:inu,2,"突入態勢",:TNA,223],
	X[:inu,2,"フリーズ",:TNA,223],
	X[:inu,3,"強行突破",:TNA,223],
	X[:inu,3,"キープオフ",:TNA,223],
	X[:inu,3,"最後の審判",:TNA,223],
	X[:neuro,0,"電脳",:TNA,120],
	X[:neuro,0,"電脳",:TNA,120],
	X[:neuro,1,"ＮＧワード",:TNA,224],
	X[:neuro,1,"自動防壁",:TNA,224],
	X[:neuro,1,"ＳＰＡＭ",:TNA,224],
	X[:neuro,1,"０１フィーリング",:TNA,224],
	X[:neuro,1,"ドミネート",:TNA,224],
	X[:neuro,1,"防壁構築",:TNA,224],
	X[:neuro,2,"サポート",:TNA,225],
	X[:neuro,2,"ターボブースト",:TNA,225],
	X[:neuro,2,"ツェノンの逆理",:TNA,225],
	X[:neuro,2,"虫使い",:TNA,225],
	X[:neuro,2,"ポルターガイスト",:TNA,225],
	X[:neuro,3,"シミュラクラム",:TNA,225],
	X[:neuro,3,"ケイオスＡＤ",:TNA,225],
	X[:neuro,3,"ブービートラップ",:TNA,225],
	X[:hiruko,0,"射撃",:TNA,120],
	X[:hiruko,0,"白兵",:TNA,120],
	X[:hiruko,1,"鱗の王",:TOS,63],
	X[:hiruko,1,"核酸毒",:TOS,63],
	X[:hiruko,1,"牙の王",:TOS,63],
	X[:hiruko,1,"瞬間適応",:TOS,63],
	X[:hiruko,1,"硬化",:TOS,63],
	X[:hiruko,1,"触手",:TOS,63],
	X[:hiruko,1,"生存本能",:TOS,63],
	X[:hiruko,2,"怪力",:TOS,64],
	X[:hiruko,2,"カメレオン",:TOS,64],
	X[:hiruko,2,"巨体",:TOS,64],
	X[:hiruko,2,"再生",:TOS,64],
	X[:hiruko,2,"腐食細菌",:TOS,64],
	X[:hiruko,2,"咆哮",:TOS,64],
	X[:hiruko,2,"守りの強酸",:TOS,64],
	X[:hiruko,3,"獣の気",:TOS,64],
	X[:hiruko,3,"磁気嵐",:TOS,64],
	X[:hiruko,3,"衝撃吸収",:TOS,64],
	X[:hiruko,3,"領域",:TOS,64],
	X[:kurogane,0,"射撃",:TNA,120],
	X[:kurogane,0,"白兵",:TNA,120],
	X[:kurogane,1,"フォルム①：ウェポン",:TOS,66],
	X[:kurogane,1,"フォルム②：アーマー",:TOS,66],
	X[:kurogane,1,"フォルム③：ヴィークル",:TOS,66],
	X[:kurogane,1,"フォルム④：ガジェット",:TOS,66],
	X[:kurogane,1,"フォルム⑤：ストラクチャ",:TOS,66],
	X[:kurogane,1,"フォルム⑥：ヒューマン",:TOS,66],
	X[:kurogane,1,"フォルム⑦：アニマル",:TOS,66],
	X[:kurogane,1,"フォルム⑧：アイコン",:TOS,66],
	X[:kurogane,1,"人鞘",:TOS,67],
	X[:kurogane,1,"プラスワン",:TOS,67],
	X[:kurogane,1,"サンデーベスト",:TOS,67],
	X[:kurogane,1,"鋼の壁",:TOS,67],
	X[:kurogane,1,"グッドデザイン",:TOS,67],
	X[:kurogane,1,"ギガセキュリティ",:TOS,67],
	X[:kurogane,1,"超怪力",:TOS,67],
	X[:kurogane,1,"ウィグワグ",:TOS,67],
	X[:kurogane,1,"騒霊",:TOS,67],
	X[:kurogane,1,"協調開始",:TOS,68],
	X[:kurogane,1,"アタックアーム",:TOS,68],
	X[:kurogane,1,"アップグレード",:TOS,68],
	X[:kurogane,1,"アナリシス",:TOS,68],
	X[:kurogane,1,"ＭＭＩ",:TOS,68],
	X[:kurogane,1,"軌道分析",:TOS,68],
	X[:kurogane,1,"機能偽装",:TOS,68],
	X[:kurogane,1,"契約",:TOS,68],
	X[:kurogane,1,"心器一体",:TOS,68],
	X[:kurogane,1,"清浄なる器",:TOS,69],
	X[:kurogane,1,"憑喪神",:TOS,69],
	X[:kurogane,1,"ドミネイター",:TOS,69],
	X[:kurogane,1,"マニピュレータ",:TOS,69],
	X[:kurogane,1,"メンテナンス",:TOS,69],
	X[:kurogane,2,"オーヴァーロード",:TOS,69],
	X[:kurogane,2,"技の真髄",:TOS,69],
	X[:kurogane,2,"トライ＆エラー",:TOS,69],
	X[:kurogane,2,"ファントムトリック",:TOS,70],
	X[:kurogane,2,"離れ業",:TOS,70],
	X[:kurogane,2,"庇護の剣",:TOS,70],
	X[:kurogane,2,"魔技",:TOS,70],
	X[:kurogane,2,"ユニゾン",:TOS,70],
	X[:kurogane,3,"フォルムスイッチ",:TOS,70],
	X[:kurogane,3,"フォルムパージ",:TOS,70],
	X[:kurogane,3,"存在証明",:TOS,70],
	X[:kurogane,3,"ロックオン",:TOS,70],
	X[:arashi,0,"操縦",:TNA,120],
	X[:arashi,0,"操縦",:TNA,120],
	X[:arashi,1,"オーヴァーレブ",:TOS,71],
	X[:arashi,1,"近接射撃",:TOS,71],
	X[:arashi,1,"精密爆撃",:TOS,71],
	X[:arashi,1,"チェック６",:TOS,71],
	X[:arashi,1,"ドッグファイト",:TOS,71],
	X[:arashi,1,"パワーファイト",:TOS,72],
	X[:arashi,1,"ヘッドオフ",:TOS,72],
	X[:arashi,1,"マシンインファイト",:TOS,72],
	X[:arashi,2,"緊急回避ボム",:TOS,72],
	X[:arashi,2,"ジャックナイフ",:TOS,72],
	X[:arashi,2,"スタンピード",:TOS,72],
	X[:arashi,2,"全弾集中",:TOS,73],
	X[:arashi,2,"フォールンエンジェル",:TOS,73],
	X[:arashi,2,"ブロック",:TOS,73],
	X[:arashi,2,"ヘヴィファイト",:TOS,73],
	X[:arashi,2,"ラピッドシューター",:TOS,73],
	X[:arashi,3,"シャットダウン",:TOS,73],
	X[:arashi,3,"シンクロアタック",:TOS,73],
	X[:arashi,3,"ハイリンケージ",:TOS,73],
	X[:arashi,3,"フルファイア",:TOS,73],
	X[:kagemusha,0,"心理",:TNA,120],
	X[:kagemusha,1,"薄影",:TOS,74],
	X[:kagemusha,1,"擬似人格",:TOS,74],
	X[:kagemusha,1,"黒子",:TOS,74],
	X[:kagemusha,1,"人格障壁",:TOS,74],
	X[:kagemusha,1,"忠節の兵",:TOS,75],
	X[:kagemusha,1,"デコイ",:TOS,75],
	X[:kagemusha,2,"二人羽織",:TOS,75],
	X[:kagemusha,2,"能面",:TOS,76],
	X[:kagemusha,2,"バックアップ",:TOS,76],
	X[:kagemusha,2,"身代わりの羊",:TOS,76],
	X[:kagemusha,2,"ミミクリー",:TOS,76],
	X[:kagemusha,3,"スナッチ",:TOS,76],
	X[:kagemusha,3,"内助の功",:TOS,76],
	X[:kagemusha,3,"パントマイム",:TOS,76],
	X[:kagemusha,3,"封じ手",:TOS,76],
	X[:ayakashi,0,"自我",:TNA,120],
	X[:ayakashi,1,"霞の体",:TOS,77],
	X[:ayakashi,1,"凍える指先",:TOS,77],
	X[:ayakashi,1,"忘却",:TOS,78],
	X[:ayakashi,1,"魔人の牙",:TOS,78],
	X[:ayakashi,1,"夢魔",:TOS,78],
	X[:ayakashi,1,"闇の外套",:TOS,78],
	X[:ayakashi,1,"夜の住人",:TOS,78],
	X[:ayakashi,2,"畏怖",:TOS,78],
	X[:ayakashi,2,"吸精",:TOS,78],
	X[:ayakashi,2,"邪眼",:TOS,78],
	X[:ayakashi,2,"瘴気の壁",:TOS,79],
	X[:ayakashi,2,"奈落堕ち",:TOS,79],
	X[:ayakashi,2,"腐敗の指先",:TOS,79],
	X[:ayakashi,2,"闇の殉教",:TOS,79],
	X[:ayakashi,2,"夜の波動",:TOS,79],
	X[:ayakashi,2,"血脈①：獣の一族",:TOS,80],
	X[:ayakashi,2,"血脈②：龍の一族",:TOS,80],
	X[:ayakashi,2,"血脈③：妖精の一族",:TOS,80],
	X[:ayakashi,2,"血脈④：鬼の一族",:TOS,80],
	X[:ayakashi,2,"血脈⑤：人形の一族",:TOS,81],
	X[:ayakashi,2,"血脈⑥：夜の一族",:TOS,81],
	X[:ayakashi,2,"血脈⑦：悪魔の一族",:TOS,81],
	X[:ayakashi,2,"血脈⑧：巨人の一族",:TOS,81],
	X[:ayakashi,2,"血脈⑨：化生の一族",:TOS,81],
	X[:ayakashi,2,"血脈⑩：死者の一族",:TOS,82],
	X[:ayakashi,2,"血脈⑪：天使の一族",:TOS,82],
	X[:ayakashi,2,"血脈⑫：伝説の一族",:TOS,82],
	X[:ayakashi,2,"血脈⑬：神族",:TOS,82],
	X[:ayakashi,3,"異形化",:TOS,79],
	X[:ayakashi,3,"幻想結界",:TOS,79],
	X[:ayakashi,3,"始祖",:TOS,79],
	X[:ayakashi,3,"妖魔の庭",:TOS,79]
]