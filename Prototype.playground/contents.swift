// Playground - noun: a place where people can play

import UIKit

//the prototype of some class(it should have copy() method)
class Prototype {
    func copy() -> AnyObject! {
        if let asCopying = ((self as AnyObject) as? NSCopying){
            return asCopying.copyWithZone(NSZone())
        }else{
            assert(false, "The class dones't implement NSCopying")
            return nil
        }
    }
}
//some class want to copy,implement NSCopying
class SubPrototype :Prototype, NSCopying {
    @objc func copyWithZone(zone: NSZone) -> AnyObject {
        var subPrototype = SubPrototype()
        //do something to copy the propertoes.
        return subPrototype
    }
    func show(){
        println("implement of prototype")
    }
}

var subPrototype = SubPrototype()
for _ in 0...9 {
    var clonePrototype = subPrototype.copy() as! SubPrototype //必须强制类型转换
    clonePrototype.show()
}
