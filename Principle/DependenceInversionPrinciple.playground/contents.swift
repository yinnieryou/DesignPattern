// Playground - noun: a place where people can play

import UIKit

/*
    定义：高层模块不应该依赖低层模块，二者都应该依赖其抽象；抽象不应该依赖细节；细节应该依赖抽象。
    问题由来：类A直接依赖类B，假如要将类A改为依赖类C，则必须通过修改类A的代码来达成。这种场景下，类A一般是高层模块，负责复杂的业务逻辑；类B和类C是低层模块，负责基本的原子操作；假如修改类A，会给程序带来不必要的风险。
    解决方案：将类A修改为依赖接口I，类B和类C各自实现接口I，类A通过接口I间接与类B或者类C发生联系，则会大大降低修改类A的几率。
    在实际编程中，我们一般需要做到如下3点：
    1.低层模块尽量都要有抽象类或接口，或者两者都有。
    2.变量的声明类型尽量是抽象类或接口。
    3.使用继承时遵循里氏替换原则。
*/

class Book0 {//高层模块,负责复杂的业务逻辑
    func getContent() -> String{
        return "This is book0."
    }
}

class NewPaper0 {
    func getContent() -> String{
        return "This is newspaper0."
    }
}

class Mother0 {
    func narrate(book:Book0){
        println("The book is \(book.getContent())")
    }
}

class Client0 {
    init(){
        var mother = Mother0()
        mother.narrate(Book0())
//        mother.narrate(NewPaper0()) //get error
    }
}

var client0 = Client0()

protocol IReading {
    func getContent() ->String
}

class Book : IReading {
    func getContent() -> String{
        return "This is book."
    }
}

class NewPaper :IReading{
    func getContent() -> String{
        return "This is newspaper."
    }
}

class Mother {
    func narrate(reading:IReading){
        println("The reading is \(reading.getContent())")
    }
}

class Client {
    init(){
        var mother = Mother()
        mother.narrate(Book())
        mother.narrate(NewPaper())
    }
}

var client = Client()

//事实上,在编程中,应该明显感受到,这是面向接口编程的实现