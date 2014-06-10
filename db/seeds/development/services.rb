# coding: utf-8

name = ["キャンドル", "チョコプレート", "写真撮影", "ケーキ"]

0.upto(4) do |idx|
  Service.create({
    service_number: idx,
    service_name: "#{name[idx % 4]}"
  },without_protection: true)
end
