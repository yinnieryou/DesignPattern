// Playground - noun: a place where people can play

import UIKit

//singleton: class constant (swift 1.2 needed)
class Singleton0{
    static let sharedInstance = Singleton0()
}

//singleton: nested struct
class Singleton1{
    class var sharedInstance:Singleton1{
        struct SingletonStruct {
            static let instance :Singleton1 = Singleton1()
        }
        return SingletonStruct.instance
    }
}

//singleton: dipatch_once
class Singleton2 {
    class var sharedInstance:Singleton2 {
        struct SingletonStruct {
            static var onceToken:dispatch_once_t = 0
            static var instance :Singleton2? = nil
        }
        dispatch_once(&SingletonStruct.onceToken, { () -> Void in SingletonStruct.instance = Singleton2() })
        return SingletonStruct.instance!
    }
}

var sharedInstance0  = Singleton0.sharedInstance
var sharedInstance00 = Singleton0.sharedInstance
var sharedInstance1  = Singleton1.sharedInstance
var sharedInstance11 = Singleton1.sharedInstance
var sharedinstance2  = Singleton2.sharedInstance
var sharedInstance22 = Singleton2.sharedInstance

ObjectIdentifier(sharedInstance0) == ObjectIdentifier(sharedInstance00)
ObjectIdentifier(sharedInstance1) == ObjectIdentifier(sharedInstance11)
ObjectIdentifier(sharedinstance2) == ObjectIdentifier(sharedInstance22)
