// Playground - noun: a place where people can play

import UIKit

//命令模式
//调用者,负责调用命令
class Invoker {
    private var command:Command!
    func action(){
        self.command.execute()
    }
}
//声明命令
class Command {
    func execute(){
        assert(false, "must be override")
    }
}
//具体的命令实现
class ConcreteCommand:Command {
    private var receiver:Receiver!
    init(receiver:Receiver){
        self.receiver = receiver
    }
    override func execute() {
        self.receiver.doSomething()
    }
}
//接受者,接受命令并执行
class Receiver {
    func doSomething(){
        println("receiver handle")
    }
}

class Client {
    init(){
        var receiver:Receiver = Receiver()
        var command:Command = ConcreteCommand(receiver: receiver)
        command.execute()//直接执行
        
        var invoker:Invoker = Invoker()
        invoker.command = command
        invoker.action() //通过调用者执行
    }
}
var client = Client()
