// Playground - noun: a place where people can play

import UIKit

//中介者模式
class AbstractColleague{
    var number:Int!
    //允许设置还未定义的类,但是后面必须实现
    func setNumber(number:Int,am :AbstracMediator){
        assert(false, "must be overrided")
    }
}

class ColleagueA: AbstractColleague {
    override func setNumber(number: Int, am: AbstracMediator){
        self.number = number
        am.AaffectB()
    }
}

class ColleagueB: AbstractColleague {
    override func setNumber(number: Int, am: AbstracMediator) {
        self.number = number
        am.BaffectA()
    }
}

class AbstracMediator {
    private var A:AbstractColleague
    private var B:AbstractColleague
    init(a:AbstractColleague,b:AbstractColleague){
        self.A = a
        self.B = b
    }
    func AaffectB(){
        assert(false, "must be overrided")
    }
    func BaffectA(){
        assert(false, "must be overrided")
    }
}

class Mediator: AbstracMediator {
    override init(a: AbstractColleague, b: AbstractColleague) {
        super.init(a:a, b:b)
    }
    override func AaffectB() {
        var number = A.number
        B.number = number * 100
    }
    override func BaffectA() {
        var number = B.number
        A.number = number / 100
    }
}

class Client {
    var collA = ColleagueA()
    var collB = ColleagueB()
    var am:AbstracMediator
    init(){
        am = Mediator(a: collA, b: collB)
        collA.setNumber(1000, am: am)
        collA
        collB
        
        collB.setNumber(1000, am: am)
        collA
        collB
    }
}

var client = Client()
