import Foundation
//შ1. ევქმნათ Class Book.
//Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.
//Designated Init.
//Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.
//Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.

class Book {
    var bookID: Int
    var title: String
    var author: String
    var isBorrowed: Bool
    
    init(bookID: Int, title: String, author: String, isBorrowed: Bool) {
        self.bookID = bookID
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    
    func bookisHere() {
        isBorrowed = true
       // print("\(bookID)  წიგნის სათაური- \(title) ავტორი -  \(author) მდგომარეობა - \(isBorrowed) - წაღებული" )
        
    }
    func whereIsBook(){
        isBorrowed = false
       // print("\(bookID)  წიგნის სათაუ რი- \(title) ავტორი -  \(author) მდგომარეობა - \(isBorrowed) - დაბრუნებული" )
       
    }
}


//2.შევქმნათ Class Owner
//Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks.
//Designated Init.
//Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან.
//Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.


class Owner {
    let ownerId: Int
    var name: String
    var BorowedBook: [Book]
    
    init(ownerId: Int, name: String, BorowedBook: [Book]) {
        self.ownerId = ownerId
        self.name = name
        self.BorowedBook = BorowedBook
    }
    
    func takeBook(book: Book) {
        if book.isBorrowed == false {
            BorowedBook.append(book)
        }
        book.bookisHere()
    }
        
    
    func bringBook(book: Book){
         for (bookindex, borBook) in BorowedBook.enumerated() {
            if  borBook.bookID == book.bookID {
                book.whereIsBook()
                BorowedBook.remove(at: bookindex)
                return
            }
        }
       
        
    }
    
}




//3.შევქმნათ Class Library
//
//Properties: Books Array, Owners Array.
//Designated Init.
//Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით.
//Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს.
//Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს.
//Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს.
//Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.
//Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ.
//Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.

class Library {
    var BooksArray: [Book]
    var onwersArray: [Owner]
    
    init(BooksArray: [Book], onwersArray: [Owner]) {
        self.BooksArray = BooksArray
        self.onwersArray = onwersArray
    }
    
    func addBook(book: Book){
        BooksArray.append(book)
    }
    func addOnwer(owner: Owner){
        onwersArray.append(owner)
    }
    func avilable() -> [Book]{
        return BooksArray.filter({book in
            !book.isBorrowed})
    }
    
    func tookBook() -> [Book]{
        return BooksArray.filter({book in
            book.isBorrowed})
    }
    
    func findWithId(ownerId: Int) -> Owner? {
        return onwersArray.filter({owener in
            owener.ownerId == ownerId
        }).first
    }
    
    
    func tookByOwner(ownerId: Int) {
        for items in onwersArray {
            if items.ownerId == ownerId{
                for books in items.BorowedBook{
                    print("owner id is = \(items.ownerId), \(books.bookID), \(books.title), \(books.author)")
                }
            }
        }
    }
    
        
    func giveBook(bookID: Int, ownerId: Int){
        var checkbook = avilable()
        var onwer = findWithId(ownerId: ownerId)
        var borrowingBook: Book?
        
        for items in checkbook {
            if items.bookID == bookID{
                borrowingBook = items
            }
        }
        
        if let items = borrowingBook{
            onwer!.takeBook(book: items)
            print("\(onwer!.name),  \(onwer!.ownerId),  \(items.bookID)")
        } else {
            print("cannot find \(ownerId)")
        }
    }
    
    func bringback(onwerId: Int, bookId: Int){
        var owner = findWithId(ownerId: onwerId)
        
    }
}


//4.გავაკეთოთ ბიბლიოთეკის სიმულაცია.
//
//შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა.
//დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში
//წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.
//დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.

var books1 = Book(bookID: 10, title: "book1", author: "vano", isBorrowed: false)
var books2 = Book(bookID: 11, title: "book2", author: "nino", isBorrowed: false)
var books3 = Book(bookID: 12, title: "book3", author: "gela", isBorrowed: false)
var books4 = Book(bookID: 13, title: "book4", author: "saba", isBorrowed: false)
var books5 = Book(bookID: 14, title: "book5", author: "lela", isBorrowed: false)

var owners1 = Owner(ownerId: 20, name: "zezva", BorowedBook: [])
var owners2 = Owner(ownerId: 30, name: "avto", BorowedBook: [])
var owners3 = Owner(ownerId: 40, name: "nika", BorowedBook: [])


var library = Library(BooksArray: [], onwersArray: [])

var booksarray = [books1, books2, books3, books4, books5]
var ownersarray = [owners1, owners2, owners3]

for allbook in booksarray {
    library.addBook(book: allbook)
}

for allowner in ownersarray {
    library.addOnwer(owner: allowner)
}
library.giveBook(bookID: 10, ownerId: 20)
library.giveBook(bookID: 11, ownerId: 20)
library.giveBook(bookID: 12, ownerId: 30)
library.giveBook(bookID: 13, ownerId: 40)
library.giveBook(bookID: 14, ownerId: 20)




//მეოთხე სავარჯიშო ბოლომდე ვერ დავწერე, მაგრამ დედლაინის მერეც ვეცდები დავწერო ✊🏻
