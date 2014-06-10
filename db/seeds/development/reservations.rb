# coding: utf-8

message = "今日は誕生日会です"
fnames = ["佐藤", "鈴木", "高橋", "田中"]
gnames = ["太郎", "次郎", "花子"]
[1, 2, 3, 4, 5].each do |id|
  user = User.find_by_id(id)
  course = Course.find_by_id(id)
  service = Service.find_by_id(id%3)
  memorial = Memorial.find_by_id(id%3)
  0.upto(3) do |idx|
    Reservation.create({
      author: user,
      date: "2013-5-12",
      time: idx % 2,
      persons: idx*2,
      course: course,
      message: message+"#{fnames[idx%4]} #{gnames[idx%3]}のお誕生会をやりたいのです",
      service: service,
      memorial: memorial
    },without_protection: true)
  end
end
