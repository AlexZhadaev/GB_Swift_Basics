//3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.


import Foundation

var year1, year2, year3, year4, year5 : Float

print("Enter deposit: ")
let sum = readLine()

print("Enter % per year ")
let perc = readLine()

year1 = Float(sum!)! + (Float(sum!)! * Float(perc!)! / 100)
year2 = year1 + (year1 * Float(perc!)! / 100)
year3 = year2 + (year2 * Float(perc!)! / 100)
year4 = year3 + (year3 * Float(perc!)! / 100)
year5 = year4 + (year4 * Float(perc!)! / 100)

print("Deposit amount after 5 years: ", (year5))
