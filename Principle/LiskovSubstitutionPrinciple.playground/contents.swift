// Playground - noun: a place where people can play

import UIKit

/*
    里氏替换原则 Liskov Substitution Principle (LSP)
    定义1：如果对每一个类型为 T1的对象 O1，都有类型为 T2 的对象O2，使得以 T1定义的所有程序 P 在所有的对象 O1 都代换成 O2 时，程序 P 的行为没有发生变化，那么类型 T2 是类型 T1 的子类型。
    定义2：所有引用基类的地方必须能透明地使用其子类的对象。
    问题由来：有一功能P1，由类A完成。现需要将功能P1进行扩展，扩展后的功能为P，其中P由原有功能P1与新功能P2组成。新功能P由类A的子类B来完成，则子类B在完成新功能P2的同时，有可能会导致原有功能P1发生故障。
    解决方案：当使用继承时，遵循里氏替换原则。类B继承类A时，除添加新的方法完成新增功能P2外，尽量不要重写父类A的方法，也尽量不要重载父类A的方法。
    里氏替换原则通俗的来讲就是：子类可以扩展父类的功能，但不能改变父类原有的功能.
    包含四层含义：
    1.子类可以实现父类的抽象方法，但不能覆盖父类的非抽象方法。
    2.子类中可以增加自己特有的方法。
    3.当子类的方法重载父类的方法时，方法的前置条件（即方法的形参）要比父类方法的输入参数更宽松。
    4.当子类的方法实现父类的抽象方法时，方法的后置条件（即方法的返回值）要比父类更严格。

*/


class A {
    func func1(a:Int,b:Int) -> Int{
        return a - b
    }
}

class B: A {
    //在对func1覆写的时候没有考虑原本的父类的作用
    override func func1(a: Int, b: Int) -> Int {
        return a + b
    }
    func func2(a:Int,b:Int) -> Int {
        return func1(a, b: b) + 100
    }
}

class Client {
    init(){
        var a = A()
        println("100-50=\(a.func1(100, b: 50))")
        println("100-80=\(a.func1(100, b: 80))")
        
        var b = B() //显然,func1被破坏了
        println("100-50=\(b.func1(100, b: 50))")
        println("100-80=\(b.func1(100, b: 80))")
        println("100+20+100=\(b.func2(100, b: 20))")
    }
}

var client = Client()
