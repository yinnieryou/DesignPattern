// Playground - noun: a place where people can play

import UIKit

//访问者模式
class Element {
    func accept(visitor:IVisitor){
        assert(false, "must be overrided")
    }
    func doSomething(){
        assert(false, "must be overrided")
    }
}

protocol IVisitor{
    func visit(el1:ConcreteElement1)
    func visit(el2:ConcreteElement2)
}

class ConcreteElement1:Element {
    override func doSomething() {
        println("这是元素1")
    }
    override func accept(visitor: IVisitor) {
        visitor.visit(self)
    }
}
class ConcreteElement2:Element {
    override func doSomething() {
        println("这是元素2")
    }
    override func accept(visitor: IVisitor) {
        visitor.visit(self)
    }
}

class Visitor: IVisitor {
    func visit(el1: ConcreteElement1) {
        el1.doSomething()
    }
    func visit(el2: ConcreteElement2) {
        el2.doSomething()
    }
}

class ObjectStructure {
    class func getList() ->[Element] {
        var list :[Element] = []
        for _ in 0...9 {
            list.append(ConcreteElement1())
        }
        for _ in 0...9 {
            list.append(ConcreteElement2())
        }
        return list
    }
}

class Client {
    init(){
        var list = ObjectStructure.getList()
        for e:Element in list {
            e.accept(Visitor())
        }
    }
}

var client = Client()
