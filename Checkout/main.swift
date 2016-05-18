//
//  main.swift
//  Checkout
//
//  Created by Joseph Li on 5/17/16.
//  Copyright © 2016 Broseph. All rights reserved.
//

import Foundation

// I created a struct to make it easier to pass into an array
struct Item {
    var description:String
    var qty:Int
    var pricePerUnit:Double
}

var input: Int = -1;
var item: Item
var shoppingCart: [Item] = []

// while input is not 3 (quit), keep printing menu
while(input != 3) {
    print("1) Add an item to your cart\n"
        + "2) Proceed to checkout\n"
        + "3) Quit", terminator: "\n> ")
    // read line from user, stripping new line
    input = (Int((readLine(stripNewline: true))!))!
    
    // switch on input
    switch input {
    case 1:
        // enter item information
        print("Enter item description: ", terminator: "")
        var description = readLine(stripNewline: true)!
        
        print("Enter item quantity: ", terminator: "")
        var qty = (Int(readLine(stripNewline: true)!)!)
        
        print("Price per unit: $", terminator: "")
        var pricePerUnit = (Double(readLine(stripNewline: true)!)!)
        
        // create a tuple from data collected
        item = Item(description: description, qty: qty, pricePerUnit: pricePerUnit)
        // insert item tuple into the beginning of array
        shoppingCart.insert(item, atIndex: 0)
        break
    case 2:
        // if shopping cart is empty, do not complete checkout
        // otherwise, calculate subtotal, taxes, and total
        if (shoppingCart.count <= 0){
            print("Shopping cart is empty")
        } else {
            var subtotal = 0.0
            for item in shoppingCart{
                print("\(item.qty) – "
                    + "\(item.description) "
                    + "@ \(String(format:"%.2f", item.pricePerUnit)) ea")
                subtotal += Double(item.qty) * item.pricePerUnit
            }
            print("Subtotal: $\(String(format:"%.2f",subtotal))")
            var taxPercent = 4.712
            var tax = subtotal * taxPercent/100
            print("Tax (\(String(format:"%.3f",taxPercent))%): $\(String(format:"%.2f",subtotal))")
            var total = subtotal + tax
            print("Total: $\(String(format:"%.2f",total))")
            
            input = 3//exit program
        }
        
    default: ()
        
    }
}


