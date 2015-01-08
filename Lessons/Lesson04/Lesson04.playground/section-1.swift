// Playground - noun: a place where people can play
// Lesson 04

func helloWorld() {
    println("hello function!")
    println("again!")
}

helloWorld()
helloWorld()
helloWorld()


// parameter vs. no parameter
// use "if" and "let" to check if optionals exist
func helloWorldtoName (name: String) {
    var string = "Hello \(name)"
    println(string)
}

helloWorldtoName("Rudd")
helloWorldtoName("Sean")

// functions are explicit about what they take in, i.e. String vs. Int
var nameTwo = "Rudd"
func helloWorldwoParam() {
    println(nameTwo)
}
helloWorldwoParam()

func helloWorldTwoPeople(name: String, nameTwo: String) {
    println("Hello \(name) and \(nameTwo)")
}

helloWorldTwoPeople("Sean", "Travis")


func formattedHello (name: String) -> String {
    return "Hello \(name), have a great class!"
}

println(formattedHello("Rudd") + " Woohoo!")
var formattedText = formattedHello
println(formattedText)

func lengthofNames(name: String, nameTwo: String) -> (Int, Int) {
    return (countElements(name), countElements(nameTwo))
}

println(lengthofNames ("Rudd", "Travis").1)
// .1 gives you the 2nd name


// Complete these, in order, writing code under each TODO statement. Each statement calls for a function to be written, write each of them and then immediately call it after the function definition.

// TODO: Write a function that prints out "Hello world!" 10 times

func todo1() {
    for x in 1...10 {
        println("Hello World!")
    }
}

todo1()

func todo1Alt() {
    var counter = 0
    while counter < 10 {
        counter = counter + 1
        println("Hello World")
// printing is irrelevant to the user, only for debugging
    }
}

// TODO: Write a function that prints out "Hit this line {number of iterations of the loop} times!" 20 times

func todo2() {
    for x in 1...20 {
        println("Hit this line \(x) times!")
    }
}

todo2()

func todo2Alt(x: Int) {
    for todo2Index in 1...x {
        println("Hit this line \(x) times")
    }
}

todo2Alt(3)

let integer = 3
let double = 3.0


// TODO: Write a function that accepts a string as a parameter. Print "Hello {value of string}!"

func todo3(name: String) {
    println("Hello \(name)")
}

let name1 = "Snow White"
let name2 = "Cinderella"

todo3(name1)
todo3(name2)
todo3("Travis")


// TODO: Write a function accepts a string optional. If the string optional exists, print "Hello {value of string}!". If it doesn't, print "Hello world!"

func todo4(outsideName name:String?) {
    if let realname = name {
        //what is the state of this optional? is it nothing or something?
        println("Hello \(realname)")
    } else {
        println("\"name\" is nil")
//        println("Hello world!")
    }
}

todo4(outsideName: "blah")

todo4(outsideName: nil)


// TODO: Write a function that takes one parameter, n, and returns an integer, the nth series in the fibonacci sequence. The first fibonacci number is 0, the second is 1, the third is 1, the fourth is 2, fifth is 3, sixth is 5, etc. fibonacci numbers at sequence n are the sum of the n-1 and n-2 fibonacci number.

func todo5(n:Int) -> Int{
    var n1 = 0, n2 = 1, n3 = 1
    if n == 0 {
        return(n1)
    } else if n == 1 {
        return(n2)
    } else if n == 2 {
        return(n3)
    } else {
        for index in 3...n {
            n1 = n2
            n2 = n3
            n3 = n1 + n2
        }
        return(n3)
    }
}

todo5(7)


// TODO: Write a function that calls the above function in order to print the sum of the first 20 fibonacci numbers.

func todo6() {
    var sum: Int = 0
    for counter in 0...19 {
        sum = sum + todo5(counter)
    }
    println(sum)
}

func todo6Alt(index: Int) -> Int {
    var sum = 0
    for i in 1...index {
        sum += todo5(i)
    }
    return sum
}

var f = 3

f = f + 1
f += 1
f++ //use the variable, and then increment it
++f //increment the variable, and then use it

// STRING IS AN ARRAY OF CHARACTERS

// TODO: Write a function that takes in a number and prints out whether it is prime, composite or neither.

func todo7(testnumber:Int) -> String {
    
    let neither = "neither"
    
// identify -, 0 and 1. they are special cases.
    if testnumber <= 1 {
        return neither

// identify 2. it is prime
    } else if testnumber == 2 {
        return "prime"
        
// divide testnumber by all numbers greater than 1 and less than itself
    } else {
        var isPrime = true
        for divisor in 2...(testnumber - 1) {
// testnumber divided by divisor
// does divisor yield a remainder that is an integer?
            var remainder: Int
            remainder = testnumber % divisor
            if remainder == 0 {
                isPrime = false
                break
            }
        }
        if isPrime {
            return("Prime")
        } else {
            return("Composite")
        }
    }
}

func todo7Alt (testNumber: Int) -> String {
    if testNumber <= 1 {
        return "neither"
    } else if testNumber == 2 {
        return "prime"
    } else {
        for divisor in 2...(testNumber - 1) {
            if testNumber % divisor == 0 {
                return "composite"
            }
        }
    }
    return "prime"
}

todo7Alt(87)


// TODO: Write a function that prints out each of the first 20 fibonacci numbers and whether they are prime. (e.g. 0 is not prime or composite, 1 is prime, etc)

func todoEight() {
    var fibTwentyNums: String = ""
    for counter in 0...19 {
        println(String(todo5(counter)))
        println(String(todo7(counter)))
    }
}

todoEight()



// TODO: Write a function that takes in two numbers, a bill amount and an optional tip percentage (represented as a float, e.g. .2 = 20% tip). Return a tuple with the total bill amount and the tip amount (if included).

func todo9(billAmount: Float, tipPercent: Float?) -> (Float, Float) {
    
    var total = billAmount
    var tipAmount: Float = 0
    
    if let t = tipPercent {
        tipAmount = billAmount * t
    }
    
    total += tipAmount
    return (total, tipAmount)
}

func todo9Original (billAmount: Float, tipPercent: Float) -> (Float, Float) {
    return (billAmount + billAmount * tipPercent, billAmount * tipPercent)
}

println(todo9Original(100, 0.2))



// TODO: Write a function that takes in a string and returns a string that is the reverse of the input. Append two strings using the + operator.

func todoTen (str: String) -> String {
    var blahReverse = String(reverse(str))
    return blahReverse + str
}

todoTen("whatsup")

func todoTenAlt(str: String) -> String {
    var reversedString = String ()
    for character in str {
        reversedString = [character] + reversedString
// [ ] turns character type into String type
    }
    return reversedString
}

todoTenAlt("blahblah")


// BONUS TODO: Write a function that takes in an array of strings and a search term string. Return a boolean indicating whether the search term string exists in the array.

func todoBonusOne(array: [String], stringToFind: String) -> Bool {
    for searchTerm in array {
        if searchTerm == stringToFind {
            return true
        }
    }
    return false
}

todoBonusOne(["why", "isnt", "this", "working"], "that")


// BONUS TODO: Write a function that accepts a string and returns a boolean indicating whether a string is a palindrome (reads the same backwards or forwards).

func todoBonusTwo(str: String) -> Bool {
    return str == todoTenAlt(str)

//    INITIAL THINKING
//    var inputStr = str
//    for counter in ______
//    if ___ == ____ {
//        return ("palindrome")
//    } else {
//        return ("not a palindrome")
//    }
}

todoBonusTwo("hannah")
todoBonusTwo("banana")


// BONUS TODO: Write a function that takes in two strings and returns a boolean indicating whether the two strings have the same number of lower case 'a's in them.
//  ATTEMPT ONE: return countElements(strOne) == countElements(strTwo)

func todoBonusThree(strOne: String, strTwo: String) -> Bool {
    
    var strOneCount: Int = 0
    for aFinderOne in strOne {
        if aFinderOne == "a" {
            strOneCount++
        }
    }
    
    var strTwoCount: Int = 0
    for aFinderTwo in strTwo {
        if aFinderTwo == "a" {
            strTwoCount++
        }
    }
    return strOneCount == strTwoCount

}

todoBonusThree("hello", "woah")


// BONUS TODO: Write a function that accepts two parameters, a string and a function that accepts a string and returns a string. Print the result of passing the string into the function 10 times.


func todoBonusFour(someFunction: (String) -> String, str: String) {
    for x in 1...10 {
        println(someFunction(str))
    }
}

todoBonusFour(todoTenAlt, "hibye")


//func todo2() {
//    for x in 1...20 {
//        println("Hit this line \(x) times!")
//    }
//}


// examples from https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html#//apple_ref/doc/uid/TP40014097-CH10-XID_243

//func addTwoInts(a: Int, b: Int) -> Int {
//    return a + b
//}
//var mathFunction: (Int, Int) -> Int = addTwoInts
//func printMathResult(mathFunction: (Int, Int) -> Int, a: Int, b: Int) {
//    println("Result: \(mathFunction(a, b))")
//}
//printMathResult(addTwoInts, 3, 5)
//// prints "Result: 8"














