//
//  main.swift
//  swift_basic
//
//  Created by dengjiangzhou on 2018/4/12.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Foundation


// Story One

let vendingMachine = VendingMachine()

//try vendingMachine.vend(itemNamed: "Deng")


// throw , 抛异常， 就 直接 到这里 swift_basic`_swift_runtime_on_report: 调试了，
// lldb


vendingMachine.coinsDeposited = 100
for _ in 0...5{
    try vendingMachine.vend(itemNamed: "Chips")
}










