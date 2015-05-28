// Playground - noun: a place where people can play

import UIKit

//观察者模式
extension Array {
    func indexOfElement<U:Equatable>(item:U) -> Int?{
        if item is Element{
            return Swift.find(unsafeBitCast(self, [U].self), item)
        }
        return nil
    }
    
    func each (call:(Int,Element) -> ()){
        for (index,item) in enumerate(self) {
            call(index,item)
        }
    }
    mutating func removeElement<U:Equatable>(element:U){
        let anotherSelf = self
        removeAll(keepCapacity: true)
        anotherSelf.each {
            (index:Int,current:Element) in
            if (current as! U) != element{
                self.append(current)
            }
        }
    }
}

class Subject{
    private var obsList :[BaseObserver] = []
    func addObserver(obs:BaseObserver){
        obsList.append(obs)
    }
    func delObserver(obs:BaseObserver){
        obsList.removeElement(obs)
        println("the obs has \(obsList)")
    }
    func notifyObserver(){
        for o:BaseObserver in obsList{
            o.update()
        }
    }
    func doSomething(){
        assert(false, "must be overrided")
    }
}

class ConcreteSubject: Subject {
    override func doSomething() {
        println("被观察者事件发生")
        self.notifyObserver()
    }
}

protocol Observer {
    func update()
}
class BaseObserver:Observer,Equatable {
    func update() {
        
    }
}

func ==(lhs: BaseObserver, rhs: BaseObserver) -> Bool{
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}

class ConreteObserver1: BaseObserver{
    override func update() {
        println("观察者1收到")
    }
}


class ConreteObserver2: BaseObserver {
    override func update() {
        println("观察者2收到")
    }
}

class Client {
    init(){
        var sub:Subject = ConcreteSubject()
        var co1 = ConreteObserver1()
        sub.addObserver(co1)
        sub.addObserver(ConreteObserver2())
        sub.doSomething()
        sub.delObserver(co1)
        sub.doSomething()
    }
}

var client = Client()
