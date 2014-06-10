# coding: utf-8

fnames = ["誕生日", "新婚", "葬式", "銀婚式","金婚式"]
gnames = ["祝!", "残念!", "おつかれさま!"]
0.upto(9) do |idx|
  memorial = Memorial.create({
    memorial_name: "#{gnames[idx%3]} #{fnames[idx%5]}",
    memorial_rate: idx/1.0 + 1.0,
 },without_protection: true)

 [1,2,3].each do |s|
    service = Service.find_by_id(s)
    service.memorial << memorial
  end
end
