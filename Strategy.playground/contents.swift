// Playground - noun: a place where people can play

import UIKit

//抽象策略
protocol IStrategy{
    func doSomething()
}
//具体的策略1
class ConcreteStrategy1: IStrategy {
    func doSomething() {
        println("策略1")
    }
}
//具体策略2
class ConcreteStrategy2: IStrategy {
    func doSomething() {
        println("策略2")
    }
}
//上下文,对策略二次封装,避免高层模块直接调用策略
class Context {
    var strategy:IStrategy!
    init(strategy:IStrategy){
        self.strategy = strategy
    }
    func execute(){
        strategy.doSomething()
    }
}

class Client {
    var context:Context!
    init(){
        context = Context(strategy: ConcreteStrategy1())
        context.execute()
        
        context = Context(strategy: ConcreteStrategy2())
        context.execute()
    }
}

var client = Client()
