import Foundation

//1.შექმენით ციკლური რეფერენცები და გაწყვიტეთ

class Car{
    let model: String
    var country : Part?
  
    init(model: String, country: Part? = nil) {
        self.model = model
        self.country = country
    }
    
    deinit {
        print("\(model) being deinitialized")
    }
}

class Part{
    let type: String
    var carmodel: Car?

    init(type: String, carmodel: Car? = nil) {
        self.type = type
        self.carmodel = carmodel
    }
    deinit {
        print("\(type) being deinitialized")
    }
    
}

var someCar: Car? = Car(model: "Toyota")
var somePart: Part? = Part(type: "Suv")
someCar?.country = somePart
somePart?.carmodel = nil //თუ ესეც ნილ არ იქნება არ მოხდება Car- ის დეინითი
 
//someCar = nil

//2.აუცილებელია ქლოჟერების გამოყენება

class Hobby {
    let hobby: String
    lazy var closure: () -> String = {
        return "\(self.hobby)"
    }
    
    
    init(hobby: String) {
        self.hobby = hobby
    }
}

var someHobby: Hobby? = Hobby(hobby: "Football")
someHobby?.closure() // print   Football

//3.აუცილებელია value და რეფერენს ტიების გამოყენება (კლასები, სტრუქტურები, ენამები და პროტოკოლები)

struct Person {
    var name: String
    var age: Int
}

var person1: Person = Person(name: "vano", age: 25)
var person2 = person1
person2.name = "gela"
person2.age = 45

print(person1)
print(person2)



enum CompassPoint{
    case north
    case south
    case east
    case west
}

var direction = CompassPoint.north

var newDirection = direction

newDirection = .south

print(newDirection)




protocol Prices {
    var price: Int {get}
}

class Bicycle: Prices {
    var price: Int
    let brand: String
    var color: Parts?
    
    init(price: Int, brand: String, color: Parts? ) {
        self.price = price
        self.brand = brand
        self.color = color
    }
    
    deinit {
        print("bicycle \(brand) being deinitialized")
    }
}

class Parts{
    let name: String
    var price: Bicycle?
    let desription: String
    init(name: String, price: Bicycle? = nil, desription: String) {
        self.name = name
        self.price = price
        self.desription = desription
    }
    
    deinit {
        print("bicycle part \(name) is being deinitialized")
    }
    
}

var newBicycle: Bicycle? = Bicycle(price: 400, brand: "focus", color: nil)
var bikeParts: Parts? = Parts(name: "pedals", desription: "for moving")
bikeParts?.price = newBicycle
//newBicycle = nil
bikeParts = nil


//4.აუცილებელია გამოიყენოთ strong, weak & unowned რეფერენსები ერთხელ მაინც

class Pet {
    var petType: String
    init(petType: String) {
        self.petType = petType
    }
    var name: Dog?
    
    deinit {
        print("deinit of \(petType)")
    }
}

class Dog {
    let dogname: String
    init(dogname: String) {
        self.dogname = dogname
    }
    var typeOfpet: Pet?
    
    deinit {
        print("deinit of \(dogname)")
    }
    
}
var pet: Pet? = Pet(petType: "dog")
var dogname: Dog? = Dog(dogname: "ყურშა")

pet!.name = dogname
dogname!.typeOfpet = pet

pet = nil    //ვერ მოხდება დეინითი რადგან სტრონგია რეფერნს ვიყენებ
dogname = nil



class School{
    let name: String
    init(name: String) {
        self.name = name
    }
    
    var classrooms: Classroom?
    
    deinit{
        print("school \(name) is being deinitialized")
    }
}

class Classroom{
    let numberOfclas: Int
    init(numberOfclas: Int) {
        self.numberOfclas = numberOfclas
    }
    
    weak var adress: School?
    
    deinit {
        print("classroom N- \(numberOfclas) is being deinitialized")
    }
}

var school: School? = School(name: "108 sajaro")
var numOfClassroms: Classroom? = Classroom(numberOfclas: 4)

//school?.classrooms = numOfClassroms
numOfClassroms?.adress = school

//school = nil // prints school 108 sajaro is being deinitialized
numOfClassroms = nil // თუ 128 ხაზი არ დავაკომნტარეთ არ მოხდება დეინიტი classroomze

class Motorcyle {
    let brand: String
    var model: MotorcyleModel?
    init(brand: String) {
        self.brand = brand
    }
    deinit {
        print("motorcycle \(brand) is being deinitialized")
    }
}

class MotorcyleModel {
    let modelName: String
    unowned let VINcode: Motorcyle
    init(modelName: String, VINcode: Motorcyle) {
        self.modelName = modelName
        self.VINcode = VINcode
    }
    
    deinit {
        print("model \(modelName) is being deinitialized")
    }
}

var bike: Motorcyle? = Motorcyle(brand: "Kawasaki")
//var nameOf: MotorcyleModel = MotorcyleModel(modelName: "ninja 400", VINcode: bike!)// თუ კომენტარს მოვუშლით მხოლოდ და 160 ხაზზე დავწერთ რომ = nameOf მაშინ motorcycle კლასის დეინიციალიზაცია მოხდება
bike!.model = MotorcyleModel(modelName: "ninja 400", VINcode: bike!)
bike = nil // ორივეს დეინითი მოხდება


class University {
    let name: String
    var courses: [Course]
    init(name: String, courses: Course? = nil) {
        self.name = name
        self.courses = []
    }
    deinit {
        print("university \(name) is being deinitialized")
    }
}

class Course{
    var coursename: String
    unowned var university: University
    unowned var nextcourse: Course?
    init(coursename: String, university: University) {
        self.coursename = coursename
        self.university = university
        self.nextcourse = nil
    }
    deinit {
        print("course of  \(coursename) is being deinitialized")

    }
}
var universityName: University = University(name: "BTU")

var course1 = Course(coursename: "programming ", university: universityName)
var course2 = Course(coursename: "Bussines ", university: universityName)
var course3 = Course(coursename: "Biology", university: universityName)

course1.nextcourse = course2
course2.nextcourse = course3
universityName.courses = [course1, course2, course3]
//როდესაც ოფშენალ unviewed ვიყენეთ ჩვენ წინასწარ უნდა გავუწეროთ მნიშვნელობა, ამის გამო არ მოხდება დეინიციალიზაცია

//5.დაიჭირეთ self ქლოჟერებში
class Phone {
    let brand: String
    var model: String?
    
    lazy var  closure: () -> String = {[unowned self] in
        if let model = self.model{
            return "brand \(self.brand), model \(model)"
        }else {
            return "\(self.brand)"
        }
    }
    
    init(brand: String, model: String? = nil) {
        self.brand = brand
        self.model = model
    }
    
    deinit {
        print("band \(brand) is being deinitialized")

    }
}
var mobile: Phone? = Phone(brand: "Apple", model: "iphone 14 pro")
print(mobile!.closure()) //prints   brand Apple, model iphone 14 pro


// თუ გვინდა weak ტიპის დავიჭიროთ ქლოჟერში მაშნ 206 ხაზზე unowned გადავაკეთოთ weak 207,208,210 ხაზებზე selfს დავუწეროთ ? ნიშანი და ასევე 225 ხაზზე



