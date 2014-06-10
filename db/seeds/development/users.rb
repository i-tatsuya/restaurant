# coding: utf-8

names = %w(Taro Jiro Hana John Mike Sophy Bill Alex Mary Tom)
fnames = ["佐藤", "鈴木", "高橋", "田中"]
gnames = ["太郎", "尚子", "花子", "賢治"]
0.upto(9) do |idx|
  User.create({
    user_name: "#{fnames[idx % 4]} #{gnames[idx % 4]}",
    address: "神奈川県川崎市多摩区",
    mail_address: "#{names[idx]}@example.com",
    phone_number: "000-0000-0000",
    birthday: "2013-12-18",
    administrator: (idx == 0),
    password: "password",
    password_confirmation: "password"
  },without_protection: true)
end
