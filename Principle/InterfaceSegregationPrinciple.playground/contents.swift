// Playground - noun: a place where people can play

import UIKit

/*
    接口隔离原则 Interface Segregation Principle (ISP)
    定义：客户端不应该依赖它不需要的接口；一个类对另一个类的依赖应该建立在最小的接口上。
    问题由来：类A通过接口I依赖类B，类C通过接口I依赖类D，如果接口I对于类A和类B来说不是最小接口，则类B和类D必须去实现他们不需要的方法。
    解决方案：将臃肿的接口I拆分为独立的几个接口，类A和类C分别与他们需要的接口建立依赖关系。也就是采用接口隔离原则。
    采用接口隔离原则对接口进行约束时，要注意以下几点：
    1.接口尽量小，但是要有限度。对接口进行细化可以提高程序设计灵活性是不挣的事实，但是如果过小，则会造成接口数量过多，使设计复杂化。所以一定要适度。
    2.为依赖接口的类定制服务，只暴露给调用的类它需要的方法，它不需要的方法则隐藏起来。只有专注地为一个模块提供定制服务，才能建立最小的依赖关系。
    3.提高内聚，减少对外交互。使接口用最少的方法去完成最多的事情。
*/

protocol I{
    func method1()
    func method2()
    func method3()
    func method4()
    func method5()
}

class AA {
    func depend1(i:I){
        i.method1()
    }
    func depend2(i:I){
        i.method2()
    }
    func depend3(i:I){
        i.method3()
    }
}

class BB :I {
    func method1() {
        println("implement method1")
    }
    func method2() {
        println("implement method2")
    }
    func method3() {
        println("implement method3")
    }
    //下面两个接口BB并不是必须的,但在protocol中被暴露出来(结构被破坏)
    func method4() {
        
    }
    func method5() {
        
    }
}

class CC {
    func depend1(i:I){
        i.method1()
    }
    func depend2(i:I){
        i.method4()
    }
    func depend3(i:I){
        i.method5()
    }
}

class DD :I {
    func method1() {
        println("implement method1")
    }
    func method4() {
        println("implement method4")
    }
    func method5() {
        println("implement method5")
    }
    //下面两个接口BB并不是必须的,但在protocol中被暴露出来
    func method2() {
        
    }
    func method3() {
        
    }
}

class Client0 {
    init(){
        var aa = AA()
        aa.depend1(BB())
        aa.depend2(BB())
        aa.depend3(BB())
        
        var cc = CC()
        cc.depend1(DD())
        cc.depend2(DD())
        cc.depend3(DD())
    }
}
var client0 = Client0()

//考虑将接口拆分
protocol I1 {
    func method1()
}
protocol I2 {
    func mehtod2()
    func method3()
}
protocol I3{
    func method4()
    func method5()
}

class A {
    func depend1(i:I1){
        i.method1()
    }
    func depend2(i:I2){
        i.mehtod2()
    }
    func depend3(i:I2){
        i.method3()
    }
}

class B : I1,I2 {
    func method1() {
        println("implement method1")
    }
    func mehtod2() {
        println("implement method2")
    }
    func method3() {
        println("implement method3")
    }
}

class C {
    func depend1(i:I1){
        i.method1()
    }
    func depend4(i:I3){
        i.method4()
    }
    func depend5(i:I3){
        i.method5()
    }
}

class D:I1,I3 {
    func method1() {
        println("implement method1")
    }
    func method4() {
        println("implement method4")
    }
    func method5() {
        println("implement method5")
    }
}

class Client {
    init(){
        var aa = A()
        aa.depend1(B())
        aa.depend2(B())
        aa.depend3(B())
        
        var cc = C()
        cc.depend1(D())
        cc.depend4(D())
        cc.depend5(D())
    }
}
var client = Client()
//接口隔离,暴露尽可能少的信息,但是得注意粒度的问题
