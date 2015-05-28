import UIKit

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
            if current as! U != element{
                self.append(current)
            }
        }
    }
}

protocol ProtocolWithAlias{
    typealias ItemType
}

protocol Iterator:ProtocolWithAlias{
    func next() -> ItemType?
    func hasNext() -> Bool
}

class ConcreteIterator<T>:Iterator {
    typealias ItemType = T
    var list = [T]()
    var cursor = 0
    init(list:[T]){
        self.list = list
    }
    func next() -> T? {
        if(hasNext()){
            return list[cursor++]
        }
        return nil
    }
    
    func hasNext() -> Bool {
        if(cursor == list.count){
            return false
        }
        return true
    }
}

protocol Aggregate:ProtocolWithAlias{
    mutating func add(obj:ItemType)
    mutating func remove(obj:ItemType)
    func iterator() -> ConcreteIterator<ItemType>
    //func iterator() -> Iterator
}


class ConcreteAggregate<T:Equatable> :Aggregate{
    typealias ItemType = T
    var list = [T]()
    func add(obj: T) {
        list.append(obj)
    }
    func remove(obj: T) {
        list.removeElement(obj)
    }
    func iterator() -> ConcreteIterator<T>{
        return ConcreteIterator(list: list)
    }
}

class Client {
    init(){
        var ag = ConcreteAggregate<String>()
        ag.add("ming")
        ag.add("xiao")
        ag.add("zi")
        var it = ag.iterator()
        while it.hasNext() {
            println("the next is \(it.next())")
        }
        ag.remove("ming")
    }
}
var client = Client()
