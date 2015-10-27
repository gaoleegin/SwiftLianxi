//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol Vehicle
{
    var numberOfWheels: Int {get}
    var color: UIColor {get set}
    mutating func changeColor()
}

struct MyCar: Vehicle {
        let numberOfWheels = 4
        var color = UIColor.blueColor()
    
    mutating func changeColor() {
        color = UIColor.redColor()
    }
}