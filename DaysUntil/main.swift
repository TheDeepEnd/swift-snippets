//
//  main.swift
//  DaysUntil
//
//  Created by Joseph Li on 4/26/16.
//  Copyright © 2016 Broseph. All rights reserved.
//

import Foundation

print("This app calculates how many days until a certain date.")

// set up the calendar object
let calendar = NSCalendar.currentCalendar()

// set up date object for today's date
let todaysDate = calendar.startOfDayForDate(NSDate())

// set up formatter of valid input string as dates
var dateFormatter = NSDateFormatter()
dateFormatter.dateFormat = "M-d-y"
dateFormatter.locale = NSLocale(localeIdentifier: "en_US")

var stringFromUser: String

repeat {
    print("Please enter a date (MM-dd-yyyy): ", terminator: "")
    // read in user date
    stringFromUser = readLine()!
    
    // catch bad input by using NSDateFormatter
    if dateFormatter.dateFromString(stringFromUser) == nil {
        print("Sorry, the date you entered is invalid.")
        stringFromUser = ""
    }
} while (stringFromUser.isEmpty)


// convert the string into a date, from the beginning of the day
var userDate = calendar.startOfDayForDate(dateFormatter.dateFromString(stringFromUser)!)

// format the date into a more readable format ("May 23, 2016" instead of "5-23-2016")
dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle


let nowString = dateFormatter.stringFromDate(todaysDate)
let laterString = dateFormatter.stringFromDate(userDate)

let calendarUnit: NSCalendarUnit = .Day
let dayDifference = abs(calendar.components(calendarUnit, fromDate: todaysDate, toDate: userDate, options: []).day)

print("\nYou entered \(laterString)")
print("Today is \(nowString)\n")

print("There are \(dayDifference) days from today until \(laterString)")