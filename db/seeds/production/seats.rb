# coding: utf-8

numbers = %w(1 1 1 1 1 1 1 4 4 4 3 4 4 4 2 2 2 2 2 2 2 2 2)
values = %w(10000 10000 10000 10000 10000 10000 10000 30000 30000 30000
            20000 40000 50000 50000 20000 20000 20000 20000 30000 30000
            30000 30000 30000)
0.upto(22) do |idx|
    seat = Seat.create({
        number: numbers[idx],
        value: values[idx]
    },without_protection: true)
end
