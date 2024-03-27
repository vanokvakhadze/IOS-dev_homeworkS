import Foundation

//1.შექმენით ენამი Gender სადაც იქნება 2 გენდერი (გენდერზე არ გამომეკიდოთ, თუ გინდათ მეტი ჩაამატეთ)

enum Gender {
    case man
    case woman
}



//2.შექმენით Protocol სახელად SuperBeing. გაუწერეთ მას ფროფერთები - name: String, strength: Int, speed: Int, weakness: String, gender: Gender

//3.SuperBeing-ის strength-სა და speed-ს მიეცით default მნიშვნელობა

protocol SuperBeing {
    var name: String {get}
    var strength: Int {get}
    var speed: Int {get}
    var weakness: String {get}
    var gender: Gender {get}
}

extension SuperBeing{
    var strength: Int {
        49
    }
    var speed: Int {
        10
    }
}

//4.შექმენით კლასები Superhero და SuperVillain, დაუქონფორმეთ SuperBeing-ს.

//5.გაუწერეთ Superhero კლასს დამატებითი პარამეტრები outfitColor: String, equipment: String, vehicle: String

//6.გაუწერეთ Superhero კლასს მეთოდი - rescue, რომელიც პარამეტრად მიიღებს დაზარალებულის სახელს და დაბეჭდავს -
//“‘სუპერგმირის სახელი’ არ შეუშინდა სახიფათო სიტუაციას და ‘დაზარალებულის სახელი’ გადაარჩინა სიკვდილს” (მაგ: “ბეტმენი” არ შეუშინდა სახიფათო სიტუაციას და “გელა” გადაარჩინა სიკვდილს).

//7.გაუწერეთ Superhero კლასს მეთოდი - combat, რომელიც პარამეტრად მიიღებს Supervillain-ს და დაბეჭდავს -
//“‘სუპერგმირის სახელი’ შეერკინა და დაამარცხა ‘ბოროტმოქმედის სახელი’” (მაგ: “ბეტმენი” შეერკინა და დაამარცხა “ჯოკერი”)


class SuperHero: SuperBeing{

    var gender: Gender
    var outfitColor: String
    var equipment: String
    var vehicle: String
//
    var name: String
    var strength: Int
    var speed: Int
    var weakness: String
    
    init(name: String, strength: Int, speed: Int, weakness: String, gender: Gender, outfitColor: String, equipment: String, vehicle: String) {
        self.name = name
        self.strength = strength
        self.speed = speed
        self.weakness = weakness
        self.gender = gender
        self.outfitColor = outfitColor
        self.equipment = equipment
        self.vehicle = vehicle
    }
    
    func rescue(sufferedPerson: String) {
        print("\(name)  არ შეუშინდა სახიფათო სიტუაციას და \(sufferedPerson) ადაარჩინა სიკვდილს")
    }
    
    func combat(nameOfVilians: SuperVillain){
        print("\(name)  არ შეუშინდა სახიფათო სიტუაციას და \(nameOfVilians.name) gადაარჩინა სიკვდილს")
    }
}

//8.გაუწერეთ SuperVillain კლასს დამატებითი პარამეტრები evilScheme: String, obsession: String, rivalry: String

//9.გაუწერეთ SuperVillain კლასს მეთოდი - attack - რომელიც პარამეტრად მიიღებს Superhero-ს და დაბეჭდავს -

//“ბოროტმ. სახელი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “სუპერგმირის სახელი” მის შეჩერებას თუ შეძლებს” (მაგ: “ჯოკერი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “ბეტმენი” მის შეჩერებას თუ შეძლებს)

//10.გაუწერეთ SuperVillain კლასს მეთოდი experimentation - რომელიც პარამეტრად მიიღებს სტრინგს (subject) და დაბეჭდავს -
//“‘ბოროტმოქმედის სახელი’ ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად ‘მსხვერპლის სახელი’ აღმოჩნდა” (მაგ: “ჯოკერი” ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად “გელა” აღმოჩნდა)
class SuperVillain: SuperBeing{
    var name: String
    var strength: Int
    var speed: Int
    var weakness: String
    var gender: Gender
    //
    var evilScheme: String
    var obsession: String
    var rivalry: String

    init(name: String, stength: Int, speed: Int, weakness: String, gender: Gender, evilScheme: String, obsession: String, rivalry: String) {
        self.name = name
        self.strength = stength
        self.speed = speed
        self.weakness = weakness
        self.gender = gender
        self.evilScheme = evilScheme
        self.obsession = obsession
        self.rivalry = rivalry
    }
    
    func attack(nameOfHero: SuperHero){
        print("\(name) გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა \(nameOfHero.name) მის შეჩერებას თუ შეძლებს ")
    }
    
    func experimentation(person: String){
        print("\(name) ქსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად არის \(person) ")
    }
}


//11. შექმენით მინიმუმ 5-5 ობიექტი თითოეული SuperBeing-ის დაქონფირმებული კლასებიდან

var hero1 = SuperHero(name: "ბეტმენი", strength: 21, speed: 22, weakness: "კათების ფობია", gender: .man, outfitColor: "შავი", equipment: "დანა", vehicle: "ბეტმობილი")

var hero2 = SuperHero(name: "სპაიდერმენი", strength: 30, speed: 8, weakness: "მწერებს ჭამს", gender: .man, outfitColor: "წითელი-შავში", equipment: "ობობის ქსელი", vehicle: "სქროლი")

var hero3 = SuperHero(name: "რკინის კაცი", strength: 35, speed: 14, weakness: "მაგნიტზე ეკრობა", gender: .man, outfitColor: "ლურჯი-წითელი", equipment: "ფარი", vehicle: "პატრულის შკოდა")

var hero4 = SuperHero(name: "ბეტვუმენი", strength: 50, speed: 15, weakness: "ყვავების ფობია", gender: .woman, outfitColor: "მწვანე", equipment: "წიწაკის სპრეი", vehicle: "ელანტრა")

var hero5 = SuperHero(name: "მიხო", strength: 100, speed: 35, weakness: "ღვინო", gender: .man, outfitColor: "შავი", equipment: "ღვინის ჭიკა", vehicle: "ურემი")


var villain1 = SuperVillain(name: "ნონა", stength: 32, speed: 80, weakness: "მუქარა", gender: .woman, evilScheme: "შეიჭრას და ფული წაიღოს", obsession: "განერვიულება", rivalry: "დედამთილი")

var villain2 = SuperVillain(name: "ჯონი", stength: 46, speed: 21, weakness: "ბმვ-ს დანახვაზე გული მისდის", gender: .man, evilScheme: "მერსედესების გაქრობა", obsession: "ბმს-ს გაბატონება", rivalry: "ნებისმიერი ვინც ბმვ-ზე ცუდს იტყვის")

var villain3 = SuperVillain(name: "სელენა", stength: 12, speed: 5, weakness: "ყავის სმის დროს ეძინება", gender: .woman, evilScheme: "აშშ.- ის პრეზიტენდის მოტაცება", obsession: "გამოსასიდის დაკისრება", rivalry: "ტრამპი")

var villain4 = SuperVillain(name: "ვინამი", stength: 18, speed: 16, weakness: "დალტონიკი", gender: .man, evilScheme: "დედამიწის განადგურება", obsession: "ბაშვობის ოცნება", rivalry: "ჰალკი")

var villain5 = SuperVillain(name: "კაპიტანი სიცივე", stength: 10, speed: 3, weakness: "სითბოში ითიშება", gender: .man, evilScheme: "მზის განადგურება", obsession: "მზეს ვერ იტანს", rivalry: "თოვლის კაცი")

hero1.rescue(sufferedPerson: "ლელა წურწუმია")

hero1.combat(nameOfVilians: villain1)

villain1.attack(nameOfHero:  hero1)

villain1.experimentation(person: "გივი")



//optional


//1.დაწერეთ ჯენერიკ ფუნქცია compareSwiftness რომელიც იღებს მხოლოდ ორ პარამეტრს პირველ და მეორე სუპერგმირებს რომლებიც დაქვემდებარებულები იქნებიან */SuperBeing პროტოკოლზე, ფუნქცია უნდა აბრუნებდეს სტრინგს

//2.ფუნქციის ბადიში შეამოწმეთ speed მნიშვნელობები ორივე სუპერგმირის

//3.დააბრუნეთ სტრინგი აღწერით თუ რომელი სუპერგმირია უფრო სწრაფი (გაითვალისწინეთ ისიც თუ სიჩქარეები ერთმანეთის ტოლია)

func copareSwiftness<T: SuperBeing, S: SuperBeing>(nameOfHero: T, nameOfVilians: S) -> String {
     if  nameOfHero.speed < nameOfVilians.speed {
         return nameOfVilians.name
     }else if  nameOfHero.speed > nameOfVilians.speed  {
         return nameOfHero.name
     }else {
         return "სუპერგმირებს თანაბარი სიჩქარე აქვთ"
     }
    
    
}

copareSwiftness(nameOfHero: hero1, nameOfVilians: villain1)
