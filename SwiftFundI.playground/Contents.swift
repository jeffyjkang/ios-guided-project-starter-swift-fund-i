//: # Swift Fundamentals I
//: ## Hello, World!
//: As tradition dictates, any exploration of a new language needs to start with "hello, world"

let helloWorld = "Hello World!"
print(helloWorld)

//: ## Comments
//: A comment is text that is ignored by the compiler. So it can be plain text, or even code. If it formatted like the examples below, it will be completely ignored when the project is built. Comments are notes to yourself or others about how a given block of code functions.

// A single line comment is one with two slashes as the first characters
// This is another comment that is going to be ignored by the compiler
// Here is a single line comment

/*
 * A multi-line comment
 * is one that is bounded by
 * /* and */ characters
 */

/*
 Here is line 1
 Here is line 2
 Everything that i type in between the aterisks will be commented out and ignored by the compiler
 */

//: ## Identifiers
//: first character A-Z or a-z or _, followed by any of these plus 0-9
let name = "Johnny"
let age = 28
//This is snake case
let this_is_a_container = "Hi container"
//Camel case
// first letter of each word is capitalized except for the first word
let thisIsAContainer = "Hi camel case container"
let lambdaSchool = "awesome"
let is100 = "100%"
let _travelBack = "1985"
print("Lambda School is \(is100) \(lambdaSchool)")

//: ## Mutability
//: There are two kinds of containers that hold values in Swift. One kind is called a constant, because once a value has been set, it cannot change for the lifetime of that container. Constants are declared with the `let` keyword.
let students = 30
let staff = 4
let totalPeople = students + staff
print(totalPeople)

//: Variables are declared with the 'var' keyword
var appleCount = 10
appleCount = appleCount + 5
print(appleCount)

//: ## Type Inference and Explicit Typing
//: All containers in Swift must have a type set on them. The containers we've seen so far had their types set implicitly. This is called _type inference_. Meaning the kind of object stored in the container was determined by looking at what kind of value was assigned to the container.

let ios = "Apple's mobile operating system"

//: In the line above, the constant `ios` stores a value "Apple's mobile operating system". This value is a `String`, so the data type of `ios` is `String`. The type was _inferred_ by the value provided.
//: Another way to type a container is to set it explicitly. See some examples of this below.

let price: Double = 1299.99
let onSale: Bool = false
let modelName: String = "Macbook Pro"
let discountQty: Int = 15

if onSale{
    print("\(modelName) on sale for \(price)")
} else{
    print("\(modelName) at regular price: \(price). But at least \(discountQty) for special pricing")
}

//: ## Type Safety
//: Once a container's data type is set, it cannot hold a value of any other type

var life = 42
//life = "The ultimate answer to life, the universe and everything"

//: ## Type Coercion
//: Types are never automatically converted into another type.

let label = "The width is "
let width = 94
let widthLabel = label + String(width)
print(widthLabel)

let x: Int = 12
let y: Double = 3.2

print(Double(x)/y)

//: ## String Interpolation and Concatenation
//: Using the `+` operator with two strings is called _string concatentation_. One string is appended to the end of another.

let heightLabel = "The height is " + "100"
print(heightLabel)

//: The below example shows the _string interpolation_ characters (`\()`). These allow a `String` (or non-string) value to be placed in-line inside a larger `String` literal value. If the value is not already a `String`, it will be converted.

let anotherWidthLabel = "The width is \(12 + 27)"
print(anotherWidthLabel)

//: ## Collections
//: ### Arrays
//: A Swift array is a collection of like objects, and they are stored in the order they are added. Accessing a particular element is done by using its index value (which starts at 0).

let shipCaptains = ["Malcolm Reynolds", "Jean-Luc Picard", "Han Solo", "James T. Kirk"]
let sameCaptains = ["Malcolm Reynolds", "Jean-Luc Picard", "Han Solo", "James T. Kirk"]
let differentCaptains = ["Kathryn Janeway", "Poe Dameron"]
print(shipCaptains[2])

//: Array equality is determined by looking at each element. If all elements are the same, and in the same order, the two arrays are equal.

if shipCaptains == sameCaptains {
    print("Arrays are equal")
} else {
    print("Arrays are not equal")
}

//: Since `shipCaptains` was declared as a constant, we must convert it to a mutable array before we can add entries.

var moreCaptains = shipCaptains
//two ways to insert elements into an arrya
moreCaptains.append("Kathryn Janeway")
print(moreCaptains)

// this is for modifying a value already in the array
//moreCaptains[1] = "Poe Dameron"
//print(moreCaptains)

moreCaptains.insert("Poe Dameron", at: 1)
print(moreCaptains)

moreCaptains.remove(at:2)
print(moreCaptains)

//: ### Dictionaries
//: A Swift dictionary is similar to an array in that is a collection, but the items are stored in no particular order. To access an item, its associated key is provided. Dictionaries are also called "key-value" stores. The key has a type, and the value can have the same or a different type.

var occupations = ["Tim": "Firefighter", "John": "iOS Engineer", "Murphy": "Web Developer", "Josh": "Web Developer"]
occupations["Josh"]
occupations["Jimmy"]
//: ## Looping
//: ### `for`
//: `for` loops allow for iterating over a collection of elements (usually an array), examining each element in turn.
let scores = [75, 43, 103, 87, 12, 13, 19]
var passingStudents = 0
for score in scores {
    if score > 70 {
        passingStudents+=1
    }
}
print(passingStudents)

//: ### `switch`
//: `switch` statements are useful when a multiple-choice path is possible for your code, and you want to choose a single path at runtime, based on some criteria.

let number = 122

switch number {
case 1:
    print("Got 1")
case 2:
    print("Got 2")
case 3,4,5:
    print("Got 3 or 4 or 5")
case 6...22:
    print("Got 6 to 22")
default:
    print("Got default")
}

//: ## Functions
//: A function in Swift is nothing more than a collection of instructions that accomplish some task. The advantage to grouping the instructions into a function is that the function can then be called whenever that task should be performed, rather than having to list out those instrutions a second, third, or nth time.

// internal and external parameters
// internal is used within the scope of the function
// external is "seen" when calling the function
func averageScore(scores: [Int]) {
    // total divided by the number of scores
    var totalScore = 0
    for score in scores {
        totalScore += score
    }
    let score = totalScore / scores.count
    print(score)
}

averageScore(scores: [1,2,3])

func averageScoreWithPrecision(scores: [Int])-> Double {
    var totalScore: Double = 0
    for score in scores {
        totalScore += Double(score)
    }
    return totalScore / Double(scores.count)
}

let previseAvgScore = averageScoreWithPrecision(scores: scores)
print(previseAvgScore)

//: ## Tuples
//: Tuples are a lightweight way of grouping related values into a single compound value.

let carrots = (name:"carrots", aisle: 4, category: "produce", count: 25)
print(carrots.aisle)
print(carrots.category)
