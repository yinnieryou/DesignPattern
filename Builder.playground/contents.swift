// Playground - noun: a place where people can play

import UIKit

//product implement
class Product {
    var name:String = ""
    var type:String = ""
    func showProduct(){
        println("name is \(name)")
        println("type is \(type)")
    }
}
//Builder protocol
protocol Builder{
    func setPart(name:String,type:String)
    func getProduct() -> Product
}
//Builder implement(create product)
class ConcreteBuilder: Builder {
    private var product = Product()
    func setPart(name: String, type: String) {
        product.name = name
        product.type = type
    }
    func getProduct() -> Product {
        return product
    }
}
//create builder
class Director {
    //    var builder = ConcreteBuilder() //每次创建Product都应该新创建一个builder,因为同用builder会导致混乱(引用缘故).故,应该使每一个product都有属于自己的builder
    let aBuilder = ConcreteBuilder()
    let bBuilder = ConcreteBuilder()
    func getAProduct() -> Product{
        aBuilder.setPart("BMW", type: "X7")
        return aBuilder.product
    }
    func getBProduct() -> Product{
        bBuilder.setPart("Audi", type: "Q5")
        return bBuilder.product
    }
}

class Client {
    var director :Director!
    var product1 :Product!
    var product2 :Product!
    init(){
        director = Director()
        product1 = director.getAProduct()
        product1.showProduct()
        
        product2 = director.getBProduct()
        product2.showProduct()
    }
}
var client = Client()
client.product1
client.product2
client.director