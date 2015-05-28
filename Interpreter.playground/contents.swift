// Playground - noun: a place where people can play

import UIKit

class Context0 {
    
}

class Stack<T> {
    var list:[T] = []
    func pop() -> T{
        return list.removeLast()
    }
    func push(obj:T){
        list.append(obj)
    }
    func size() -> Int{
        return list.count
    }
}

class Expression {
    func interpreter(ctx:Context0) -> AnyObject{
        return self
    }
}

class TerminalExpression: Expression {
    override func interpreter(ctx: Context0) -> AnyObject {
        println("terminal")
        return self
    }
}

class NonterminalExpression: Expression {
    init(expression:[Expression]) {
        println("do nothing")
    }
    override init() {
        
    }
    override func interpreter(ctx: Context0) -> AnyObject {
        println("nonterminal")
        return self
    }
}

class Client {
    var expression = "ABCEDF"
    var ctx = Context0()
    var stack = Stack<Expression>()
    init(){
        for i in expression {
            switch i {
            case "A":
                stack.push(NonterminalExpression())
            case "B":
                stack.push(NonterminalExpression())
            case "C":
                stack.push(TerminalExpression())
            default :
                stack.push(TerminalExpression())
            }
        }
        for _ in stack.list {
            var exp = stack.pop()
            exp.interpreter(ctx)
        }
    }
}

var client = Client()
