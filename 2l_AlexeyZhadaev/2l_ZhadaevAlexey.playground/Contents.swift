import Cocoa

//1. Написать функцию, которая определяет, четное число или нет.
let number: Int = 31
let evenOrOdd: () = number % 2 == 0 ? print ("Number is even") : print ("Number is odd")

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
let divbythree: () = number % 3 == 0 ? print ("Number is divided by 3") : print ("Number is not divisible by 3")

//3. Создать возрастающий массив из 100 чисел.
var Array: [Int] = []
for i in 0...100
{
    Array.append(i)
}

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
for (_, value) in Array.enumerated()
{
    if (value % 2 == 0) || (value % 3 > 0)
    {
        Array.remove(at: Array.firstIndex(of: value)!)
    }
}
print (Array)

