# coding: utf-8

fnames = ["誕生日", "新婚", "葬式", "銀婚式","金婚式"]
gnames = ["祝!", "残念!", "おつかれさま!"]
0.upto(9) do |idx|
  memorial = Memorial.create({
    memorial_name: "#{gname[idx%3]} #{fname[idx%5]}",
    memorial_rate: idx/1.0,
    service_id: idx
  }, without_protection: true)
  p "******"
  [0,1,2].each do |s|
    p "aaaaaa"
    service = Service.find_by_id(s)
    p service
    service.selectingmemorials << memorial
  end
end
