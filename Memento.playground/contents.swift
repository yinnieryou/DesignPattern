// Playground - noun: a place where people can play

import UIKit

//备忘录模式
class Originator{
    var state1 = ""
    var state2 = ""
    var state3 = ""
    func createMemento() -> Memento {
        return Memento(map: BeanUtils.backupProp(self))
    }
    func restoreMemento(memento:Memento){
        BeanUtils.restoreProp(memento.stateMap,originator: self)
    }
    func toString() -> String{
        return "state1=\(state1)+state2=\(state2)+state3=\(state3)"
    }
}

class Memento {
    var stateMap:Dictionary<String,AnyObject> = [:]
    init(map:Dictionary<String,AnyObject>){
        self.stateMap = map
    }
}

class BeanUtils {
    class func backupProp(obj:Originator) -> Dictionary<String,AnyObject>{
        var map:Dictionary<String,AnyObject>
        map = ["state1":obj.state1 as AnyObject,"state2":obj.state2  as AnyObject,"state3":obj.state3  as AnyObject]
        return map
    }
    class func restoreProp(propMap:Dictionary<String,AnyObject> ,originator:Originator){
        originator.state1 = propMap["state1"] as! String
        originator.state2 = propMap["state2"] as! String
        originator.state3 = propMap["state3"] as! String
    }
}

class Caretaker {
    var memMap:Dictionary<String,Memento> = [:]
    init(){
        
    }
}

class Client{
    init(){
        var ori = Originator()
        var careTaker = Caretaker()
        ori.state1 = "A"
        ori.state2 = "B"
        ori.state3 = "C"
        ori
        
        careTaker.memMap = ["001":ori.createMemento()]
        ori.state1 = "D"
        ori.state2 = "E"
        ori.state3 = "F"
        ori
        
        ori.restoreMemento(careTaker.memMap["001"]!)
    }
}

var client = Client()
