//
//  VendingMachine.swift
//  swift_basic
//
//  Created by dengjiangzhou on 2018/4/12.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import Foundation


enum VendingMachineError: Error{
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
// 有问题， 我不会











struct Item{
    var price: Int
    var count: Int
}


/* In the example below, the VendingMachine class has a vend(itemNamed:) method that throws an appropriate VendingMachineError
 
 
 if the requested item is
 not available,
 is out of stock,
 or has a cost that exceeds the current deposited amount:
 
 */
class VendingMachine{
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    // 机器 储存的 硬币 ，
    // 没钱找， 就不好了
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            print("invalidSelection")
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else{
            print("outOfStock")
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else{
            print("insufficientFunds: coinsNeeded \(item.price - coinsDeposited)")
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispending \(name)")
        
    }
}


