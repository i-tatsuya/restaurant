# coding: utf-8

0.upto(9) do |idx|
  Article.create({
  title: "お知らせ#{idx}",
  contents: "当レストランは4対2でSunflowerに勝利。\n2回表、6番渡辺の二塁打から7番
山田、8番高橋の連続タイムリーで2点先制。9回表、ランナー一二塁で2番田中の二塁打で
2点を挙げ、ダメを押しました。\n投げては初先発の山本が7回を2失点に抑え、伊藤、中村とつないで逃げ切りました。",
  start_date: "2013-12-19"
  },without_protection: true)
end

