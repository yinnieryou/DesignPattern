// Playground - noun: a place where people can play

import UIKit

//template pattern
class AbstractSort{ //相当于抽象类
    func sort(inout array:[Int]){assert(false, "must be override.")}
    func showSortResult(var array:[Int]){
        sort(&array)
        print("排序结果:\(array)")
    }
}
//具体的一些算法实现
class ConcreteSort :AbstractSort {
    
    override func sort(inout array:[Int]){
        var swapped = true
        while swapped {
            swapped = false
            for var i = 1 ; i < array.count; ++i {
                if(array[i-1] > array[i]){
                    var temp = array[i-1]
                    array.removeAtIndex(i-1)
                    array.insert(temp, atIndex: i)
                    swapped = true
                }
            }
        }
    }
}

class Client {
    var abs:AbstractSort = ConcreteSort()
    init(){
        var array = [1,2,44,4,5,9,100,3]
        abs.showSortResult(array)
    }
}
var client = Client()