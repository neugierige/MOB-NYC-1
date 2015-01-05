// Lesson 03 playground

import Foundation

// TODO: Create two variables, name and age. Name is a string, age is an integer.

var name: String = "Snow White"
var age: Int = 18

// TODO: Print "Hello {whatever the value of name is}, you are {whatever the value of age is} years old!"

println("Hello \(name), you are \(age) years old!")


// TODO: Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”

if age >= 21 {println("You can drink")}
if age >= 18 {println("You can vote")}

// TODO: Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.

if age >= 21 {
    println("You can drive, vote, and drink (but not at the same time")
} else if age >= 18 {
    println ("You can drive and vote")
} else if age >= 16 {
    println ("You can vote")
} else {
    println ("")
}

// TODO: Print the first fifty multiples of seven minus one (e.g. the first three multiples are 7, 14, 21. The first three multiples minus one are 6, 13, 20)
// for-in loop
// println of x prints numbers in "console output"

//for i in 1...50 {
//   println(i * 7 - 1)
//}


// TODO: Create a constant called number

let number = 9

// TODO: Print whether the above number is even

if number % 2 == 1 {
    println("odd")
} else {
    println("even")
}

// TODO: The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number. Print the 37th fibonacci number below

var index = 5
var a = 0, b = 1, c = 1
if index == 1 {
    println(a)
} else if index == 2 {
    println(b)
} else if index == 3 {
    println(c)
} else {
    for loop in 4...index {
        a = b
        b = c
        c = a + b
    }
    println(c)
}

// if = is assignment
// if == is check for T v. F

//for f1 in 0...36 {
//var f2 = 1, store = 0
//store = f1 + f2
//f1 = f2
//store = f1 + f2
//println(f1 + store)
//}

// TODO: Print out "Hello {whatever the value of name is}, your name is {however long the string name is} characters long!. Use countElements()

println( "Hello \(name), your name is \(countElements(name)) characters long!")


// TODO: Print the sum of one hundred random numbers. Use rand() to generate random numbers.

var sum: Int = 0
var random: Int = 0
for counter in 1...100 {
    random = Int(rand())
    sum = sum + random
}
println(sum)

