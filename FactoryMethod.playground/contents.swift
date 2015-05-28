// Playground - noun: a place where people can play

import UIKit

//对于抽象类,StackOverflow上面有两种方案:
//A,使用protocol,接近interface
//B,使用Baseclass,标注必须override(assert(false,"must be overrided"))
//事实上,Baseclass的方案是最类似抽象类的,可以写实现,可以有属性

//product interface(protocol)
//定义接口,面向接口编程
protocol IProduct{
    func productMehtod()
}

//product implement
class Product: IProduct {
    func productMehtod() {
        println("product")
    }
}

//factory interface(protocol)
protocol IFactory{
    func createProduct() -> IProduct
}

//factory implement (create product,should return the product)
class Factory:IFactory {
    func createProduct() -> IProduct {
        return Product()
    }
}

class Client {
    var factory :IFactory!
    var product :IProduct!
    init(){
        factory = Factory()
        product = factory.createProduct()
        product.productMehtod()
    }
}

var client = Client()
