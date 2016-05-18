//
//  main.swift
//  Checkout
//
//  Created by Joseph Li on 5/17/16.
//  Copyright © 2016 Broseph. All rights reserved.
//

import Foundation

// Used a struct to facilitate passing into an array
struct Item {
    var description:String
    var qty:Int
    var pricePerUnit:Double
}

var input: Int = -1;
var item: Item
var shoppingCart: [Item] = []

// Keep printing menu if the input is not 3
while(input != 3) {
    print("1) Add an item to your cart\n"
        + "2) Proceed to checkout\n"
        + "3) Quit", terminator: "\n> ")
    
    // Read user's menu selection
    input = (Int((readLine(stripNewline: true))!))!
    
    // Switch depending on user's input
    switch input {
    
    // 1: Add item to cart
    case 1:
        // Entering item information
        print("Enter item description: ", terminator: "")
        var description = readLine(stripNewline: true)!
        
        print("Enter item quantity: ", terminator: "")
        var qty = (Int(readLine(stripNewline: true)!)!)
        
        print("Price per unit: $", terminator: "")
        var pricePerUnit = (Double(readLine(stripNewline: true)!)!)
        
        // Create a tuple from data collected
        item = Item(description: description, qty: qty, pricePerUnit: pricePerUnit)
        
        // Insert item tuple into the beginning of array
        shoppingCart.insert(item, atIndex: 0)
        break
    
    // 2: Checkout process
    case 2:
        
        // If shopping cart is empty, do not complete checkout
        // Otherwise, calculate subtotal, taxes, and total and print it all out
        if (shoppingCart.count <= 0){
            print("Shopping cart is empty")
        } else {
            var subtotal = 0.0
            
            // Print out array by iterating through array
            for item in shoppingCart{
                print("\(item.qty) – "
                    + "\(item.description) "
                    + "@ \(String(format:"%.2f", item.pricePerUnit)) ea")
                
                // Add item to subtotal
                subtotal += Double(item.qty) * item.pricePerUnit
            }
            
            // More Calculations
            var taxPercent = 4.712
            var tax = subtotal * taxPercent/100
            var total = subtotal + tax
            
            print("Subtotal: $\(String(format:"%.2f",subtotal))")
            print("Tax (\(String(format:"%.3f",taxPercent))%): $\(String(format:"%.2f",subtotal))")
            
            print("Total: $\(String(format:"%.2f",total))")
            
            input = 3 // exits program, since checkout is completed
        }
    
    default: ()
        // Loop by default
    }
}


