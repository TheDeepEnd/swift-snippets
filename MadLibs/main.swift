//
//  main.swift
//  MadLibs
//
//  Created by Joseph Li on 4/22/16.
//  Copyright © 2016 Broseph. All rights reserved.
//

import Foundation

// welcome the user
print("What's your name? ", terminator: "")
let name = readLine(stripNewline: true)!
print("Hello, \(name)!")

// start a game of MadLibs
print("Enter a noun: ", terminator: "")
let noun = readLine(stripNewline: true)!

print("Enter a adverb ", terminator: "")
// I passed the string to a function that capitalizes the first letter
let adverb = (readLine(stripNewline: true)!).capitalizedString

print("Enter a adjective: ", terminator: "")
let adjective = readLine(stripNewline: true)!

print("Enter a verb: ", terminator: "")
let verb = readLine(stripNewline: true)!

// print out final string
print("\(adverb), the \(adjective) \(noun) \(verb).")