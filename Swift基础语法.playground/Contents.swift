//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum Rang:Int{
    case Ace = 1
    case Two,Three,Four,Five,Six
    case Jack,King
    func simpleDescription()->String{
        switch self{
        case .Ace:
            return "ace"
        default:
            return "aaa"
        }
    }
}


let Mystring:String = Rang.simpleDescription(.Four)()


print("\(Rang.simpleDescription(.Ace)())")





///协议和扩展
protocol ExampleProtocol{
    var simpleDescription:String { get }
    mutating func adjust()
}

class  simpleClass: ExampleProtocol{
    
    var simpleDescription:String = "simple"
    
    var anotherProperty:Int = 69105
    
    func adjust() {
        simpleDescription += ""
    }
}















