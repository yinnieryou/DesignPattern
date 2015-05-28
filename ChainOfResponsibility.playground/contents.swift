// Playground - noun: a place where people can play

import UIKit

//责任链模式
//需要处理的数据
class Level{
    var level:Int!
    init(level:Int){
        self.level = level
    }
    func above(level:Level) -> Bool{
        return self.level >= level.level
    }
}
//把相关的数据封装成一个请求
class Request {
    var level:Level!
    init(level:Level){
        self.level = level
    }
}
//响应
class Response {
    
}
//抽象的处理
class Handler {
    private var nexthandler :Handler!
    final func handleRequest(request:Request) -> Response{
        var response:Response = Response()
        if self.getHandlerLevel().above(request.level) {
            response = self.response(request)
        }else{
            if self.nexthandler != nil {
                self.nexthandler.handleRequest(request)//责任链传递
            }else{
                println("no thing can do")
            }
        }
        return response
    }
    func setNextHandler(handler:Handler){
        self.nexthandler = handler
    }
    func getHandlerLevel() -> Level {
        assert(false, "must be override")
        return Level(level: 0)
    }
    func response(request:Request) -> Response{
        assert(false, "must be override")
        return Response()
    }
}
//具体处理1
class ConcreteHandler1: Handler {
    override func getHandlerLevel() -> Level {
        return Level(level: 1)
    }
    
    override func response(request: Request) -> Response {
        println("concreteHandler1 is handle")
        return Response()
    }
}
//具体处理2
class ConcreteHandler2: Handler {
    override func getHandlerLevel() -> Level {
        return Level(level: 3)
    }
    
    override func response(request: Request) -> Response {
        println("concreteHandler2 is handle")
        return Response()
    }
}
//具体处理3
class ConcreteHandler3: Handler {
    override func getHandlerLevel() -> Level {
        return Level(level: 5)
    }
    
    override func response(request: Request) -> Response {
        println("concreteHandler3 is handle")
        return Response()
    }
}

class Client {
    init(){
        var handler1 = ConcreteHandler1()
        var handler2 = ConcreteHandler2()
        var handler3 = ConcreteHandler3()
        handler1.setNextHandler(handler2)
        handler2.setNextHandler(handler3)
        var request:Request = Request(level: Level(level: 3))
        handler1.handleRequest(request)
    }
}
var client = Client()
