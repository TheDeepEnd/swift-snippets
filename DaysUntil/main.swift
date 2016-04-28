//
//  main.swift
//  DaysUntil
//
//  Created by Joseph Li on 4/26/16.
//  Copyright © 2016 Broseph. All rights reserved.
//

import Foundation

let now = NSDate()

print("Let's find how many days until a certain date!")

print("Please enter a date (MM-dd-yyyy): ", terminator: "")
let read = readLine()

var dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "MM-dd-yy"
var userDate = dateFormatter.dateFromString(read!)
dateFormatter.locale = NSLocale(localeIdentifier: "en_US")

dateFormatter.dateStyle = .FullStyle
let userCalendar = NSCalendar.currentCalendar()
let calendarUnit: NSCalendarUnit = [.Day]
let dayDifference = userCalendar.components(calendarUnit, fromDate: now, toDate: userDate!, options: [])

print("There are \(abs(dayDifference.day)) days until \(userDate!)")