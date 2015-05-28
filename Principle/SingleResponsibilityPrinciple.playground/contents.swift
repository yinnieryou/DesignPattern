// Playground - noun: a place where people can play
//
import UIKit

/*
    单一职责原则 Single responsibility principle (SRP)
    定义：不要存在多于一个导致类变更的原因。通俗的说，即一个类只负责一项职责。
    问题由来：类T负责两个不同的职责：职责P1，职责P2。当由于职责P1需求发生改变而需要修改类T时，有可能会导致原本运行正常的职责P2功能发生故障。
    解决方案：遵循单一职责原则。分别建立两个类T1、T2，使T1完成职责P1功能，T2完成职责P2功能。这样，当修改类T1时，不会使职责P2发生故障风险；同理，当修改T2时，也不会使职责P1发生故障风险。
    优点：
      1.可以降低类的复杂度，一个类只负责一项职责，其逻辑肯定要比负责多项职责简单的多；
      2.提高类的可读性，提高系统的可维护性；
      3.变更引起的风险降低，变更是必然的，如果单一职责原则遵守的好，当修改一个功能时，可以显著降低对其他功能的影响。
*/

class Animal0 {
    func breathe(animal:String){
        println("\(animal)呼吸空气")
    }
}

class Client0 {
    init(){
        var animal = Animal0()
        animal.breathe("🐂")
        animal.breathe("🐑")
        animal.breathe("🐷")
    }
}

var client0 = Client0()

//问题:添加一种鱼,呼吸水

//解决方案1
class Terrestrial {
    func breathe(animal:String){
        println("\(animal)呼吸空气")
    }
}

class Aquatic {
    func breathe(animal:String){
        println("\(animal)呼吸水")
    }
}

class Client1 {
    init(){
        var terrestrial = Terrestrial()
        terrestrial.breathe("🐂")
        terrestrial.breathe("🐑")
        terrestrial.breathe("🐷")
        
        var aquatic = Aquatic()
        aquatic.breathe("🐟")
    }
}

var client1 = Client1()

//解决方案2
class Animal2 {
    func breathe(animal:String){
        if animal == "🐟" {
            println("\(animal)呼吸水")
        }else{
            println("\(animal)呼吸空气")
        }
    }
}

class Client2 {
    init(){
        var animal = Animal2()
        animal.breathe("🐂")
        animal.breathe("🐑")
        animal.breathe("🐷")
        animal.breathe("🐟")
    }
}

var client2 = Client2()

//解决方案3
class Animal3 {
    func breathe(animal:String){
        println("\(animal)呼吸空气")
    }
    func breathe2(animal:String){
        println("\(animal)呼吸水")
    }
}

class Client3 {
    init(){
        var animal = Animal3()
        animal.breathe("🐂")
        animal.breathe("🐑")
        animal.breathe("🐷")
        animal.breathe2("🐟")
    }
}

var client3 = Client3()
