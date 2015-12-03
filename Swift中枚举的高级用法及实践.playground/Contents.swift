//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//枚举的声明的类型是囊括可能状态的有限集，且可以具有附加值。通过内嵌，方法，关联值和匹配模式，枚举可以分层次的定义任何有组织的数据。
//深入理解
//简要概括（Diving In）
//简要概述如何定义和使用枚举
enum Movement{
    case Left
    case Right
    case Top
    case Bottom
}

//多种匹配模式
//let aMovement = Movement.Left
//switch 分情况处理
//switch aMovement{
//case .Left:print("left")
//default:()
//}
//
////明确case的情况
//if case .Left = aMovement{
//    print("left");
//}
//
//if aMovement == .Left{print("left")}

let aMovement = Movement.Left

switch aMovement{
case .Left:print("left")
default:()
}

if case .Left = aMovement{
    print("left")
}


if aMovement == .Left{
    print("left")
}

//也可以为每一个case分配一个值,在C语言中，只能为枚举分配整形值，erswift则提供了更多的灵活性
enum Movement1:Int{
    case Left = 0
    case Right = 1
    case Top = 2
    case Bottom = 3
}

//同样可以与字符串一一对应
enum House: String{
    case Baratheon = "Ours is the Fury"
    case Greyjoy = "We Do Not Sow"
    case Martell = "Unbowed,Unbent,Unbroken"
    case Stark = "Winter is Coming"
    case Tully = "Family,Duty,Honor"
    case Tyrell = "Growing Strong"
}

//或者 float double 都可以（同时注意枚举中的花式unicode），这些符号从哪里获得
enum Constants:Double{
    case π = 3.14159
    case e = 2.71828
    case φ = 1.61803398874
    case λ = 1.30357
}

enum Planet:Int{
    case Mercury = 1,Venus,Earth,Mars,Jupiter
}
//可以忽略为枚举中的case赋值
//swift枚举中best支持以下四种关联值类型
//整型
//浮点型
//字符串
//布尔类型

let bestHouse = House.Stark
print(bestHouse.rawValue)


//
let rightMovement = Movement1(rawValue: 1)
let rightMovement22 = Movement1(rawValue: 1)








