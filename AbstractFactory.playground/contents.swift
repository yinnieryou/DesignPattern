// Playground - noun: a place where people can play

import UIKit

//product1 protocol
protocol IProduct1{
    func show()
}
//product2 protocol
protocol IProduct2{
    func show()
}
//product1 implemet
class Product1: IProduct1 {
    func show() {
        println("this is product 1")
    }
}
//product2 implement
class Product2: IProduct2 {
    func show() {
        println("this is product 2")
    }
}
//factory protocol
protocol IFactory{
    func createProduct1()->IProduct1
    func createProduct2()->IProduct2
}

//factory implement
class Factory:IFactory {
    func createProduct1() -> IProduct1 {
        return Product1()
    }
    func createProduct2() -> IProduct2 {
        return Product2()
    }
}

class Client{
    var factory :Factory!
    init(){
        factory = Factory()
        factory.createProduct1().show()
        factory.createProduct2().show()
    }
}

var client = Client()
