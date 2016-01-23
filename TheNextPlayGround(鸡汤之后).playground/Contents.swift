//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//常量和变量π
let maximumNumOfLoginAttempts = 10;
let currentLoginAttempt = 0;

var welcomeMessage:String = "哈哈哈"


//:常量和变量的命名
let 🍋  = "哈哈"
print("this is a package\(🍋)")

let minValue1 = uint.min
let maxValue1 = uint.max

let minValue2 = UInt8.min
let maxValue2 = UInt8.max

let minValue3 = Int.min
let maxValue3 = Int.max

//数值型字面量
let decimaInteger = 17;
let binaryInteger = 0b10001;
let octalInteger = 0o21
let hexadecimalInteger = 0x11
//通常来讲，及时代码中的整数常量和变量已知非负，也请使用int类型，总是使用默认的整数类型可以保证你的整数类型常量和变量可以直接被复用，并且可以匹配整数类字面量的了行推断
//整数转换：如果数字超出了常量或者是变量可存储的范围

typealias AutoSample  = UInt16
let minValue4 = AutoSample.min
let maxValue4 = AutoSample.max
//关键字 typealias 就是给一个类型定义一个别名 布尔值
//Swift有一个基本的布尔值，叫做bool

let orangesareorange = true
let turnipsdelicious = false

if orangesareorange{
    print("正确")
} else{
    print("错误")
}

//元祖（tuples）把多个值组合成一个复合值，元祖内的值的类型可以是任何类型，并不要求是相同的类型，

//元组在临时组织值的时候很有用，但是并不适合创建复杂的数据结构，如果你的数据结构不是临时使用，请使用类或者结构体而不是元组
//可选类型（optionals）
//有值，等于X
//没有值

let poss:String = "123"



//toInt已经舍弃了
let possibleNumber = "123"

var serverceCode:Int?
serverceCode = nil

//在Swift和OC中的的nil的区别
// 在OC中：nil是一个不存在对象的指针
// 在Swift中：nil不是一个指针，用来表示值的缺失




























