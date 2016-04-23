//
//  main.swift
//  TipCalculator
//
//  Created by Joseph Li on 4/22/16.
//  Copyright © 2016 Broseph. All rights reserved.
//

import Foundation

print("Hello, World!")

// Let's ask the user for the price (the terminator removes the new line)
print("Please enter the total after tax: $", terminator: "")

// The readLine function reads in a String, so we have to cast it as a Double
// Notice how I use ! to unwrap the Optionals (it's a Type safety feature)
let subtotal = Double(readLine(stripNewline: true)!)

// Let's ask for the tip percent now
print("Please enter the tip percent (example .15): ", terminator: "")
let tipPercent = Double(readLine(stripNewline: true)!)

// It is a bit like C, to format the Double to 2 decimal places
// but I wanted to do the math in the same line and save it into total
let total = String(format:"%.2f", (subtotal! + (subtotal!*tipPercent!)))

// Print out the total!
print("Your total after tip is $\(total)")
