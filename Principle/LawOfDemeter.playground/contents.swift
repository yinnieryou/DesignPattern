// Playground - noun: a place where people can play

import UIKit

/*
    迪米特法则(最小知识原则) Law of Demeter (Least knowledge principle,LKP)
    定义：一个对象应该对其他对象保持最少的了解。
    问题由来：类与类之间的关系越密切，耦合度越大，当一个类发生改变时，对另一个类的影响也越大。
    解决方案：尽量降低类与类之间的耦合。
    迪米特法则的初衷是降低类之间的耦合，由于每个类都减少了不必要的依赖，因此的确可以降低耦合关系。但是凡事都有度，虽然可以避免与非直接的类通信，但是要通信，必然会通过一个“中介”来发生联系.过分的使用迪米特原则，会产生大量这样的中介和传递类，导致系统复杂度变大。所以在采用迪米特法则时要反复权衡，既做到结构清晰，又要高内聚低耦合。
*/

class Employee0 {
    var stringId :String!
}

class SubEmployee0 {
    var stringId :String!
}

class SubCompanyManager0 {
    func getAllEmployee() -> [SubEmployee0] {
        var list = [SubEmployee0]()
        for i in 0..<100 {
            var subEmployee = SubEmployee0()
            subEmployee.stringId = "subCompany + \(i)"
            list.append(subEmployee)
        }
        return list
    }
}

class CompanyManager0 {
    func getAllEmployee() -> [Employee0] {
        var list = [Employee0]()
        for i in 0..<100 {
            var employee = Employee0()
            employee.stringId = "company + \(i)"
            list.append(employee)
        }
        return list
    }
    func printAllEmployee(sub:SubCompanyManager0){ //有过多的耦合
        var list1 = sub.getAllEmployee() //这一项内容应该由sub类自己实现
        for subemployee in list1 {
            println("\(subemployee.stringId)")
        }
        var list2 = self.getAllEmployee()
        for employee in list2 {
            println("\(employee.stringId)")
        }
    }
}

class Client0 {
    init(){
        var com = CompanyManager0()
        com.printAllEmployee(SubCompanyManager0())
    }
}
var client0 = Client0()

class Employee {
    var stringId :String!
}

class SubEmployee {
    var stringId :String!
}

class SubCompanyManager {
    func getAllEmployee() -> [SubEmployee] {
        var list = [SubEmployee]()
        for i in 0..<100 {
            var subEmployee = SubEmployee()
            subEmployee.stringId = "subCompany + \(i)"
            list.append(subEmployee)
        }
        return list
    }
    func printAllEmployee(){
        var list1 = self.getAllEmployee() //这一项内容应该由sub类自己实现
        for subemployee in list1 {
            println("\(subemployee.stringId)")
        }
    }
}

class CompanyManager {
    func getAllEmployee() -> [Employee] {
        var list = [Employee]()
        for i in 0..<100 {
            var employee = Employee()
            employee.stringId = "company + \(i)"
            list.append(employee)
        }
        return list
    }
    func printAllEmployee(sub:SubCompanyManager){
        sub.printAllEmployee()
        var list2 = self.getAllEmployee()
        for employee in list2 {
            println("\(employee.stringId)")
        }
    }
}

class Client {
    init(){
        var com = CompanyManager()
        com.printAllEmployee(SubCompanyManager())
    }
}
var client = Client()
//职责应该明确,不能有过多的耦合,不属于A的不用A实现