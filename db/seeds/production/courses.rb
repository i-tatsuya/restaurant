# coding: utf-8

heads = ["洋風", "シェフの気まぐれ", "魚介の旨味たっぷりの", "肉汁あふれる", "女子力たっぷり"]
body = ["秋の味覚コース", "旬ものコース", "スペシャルコース", "スイーツコース", "豪華絢爛コース"]
0.upto(9) do |idx|
  course = Course.create(
  { course_name: "#{heads[idx % 4]} #{body[idx % 5]}",
    price: idx * 5000,
    details: "hogehogehogehogehoge"
  },without_protection: true
  )
  fname = Rails.root.join("db/seeds/production", "course#{idx%3+1}.jpg")
  courseimg = CourseImg.create(
    { course: course,
      data: File.open(fname,"rb").read,
      content_type: "image/jpeg"
    },without_protection: true
  )
  p courseimg
end
