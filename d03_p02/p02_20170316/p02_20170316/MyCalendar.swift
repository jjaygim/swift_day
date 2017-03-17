//
//  MyCalendar.swift
//  p02_20170316
//
//  Created by 김재정 on 2017. 3. 16..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import Foundation

class MyCalendar {
    var date: Date
    var formatter: DateFormatter
    var components: DateComponents
    var calen: Calendar
    init() {
        date = Date()
        components = DateComponents()
        formatter = DateFormatter()
        calen = Calendar(identifier: Calendar.Identifier.gregorian)
    }
    func makeTodayTuple() -> (Int, Int, Int, Int, Int, Int) {
        var dateTuple: (Int, Int, Int, Int, Int, Int)
        formatter.dateFormat = "yyyy MM dd yy mm ss"
        let dateArray = formatter.string(from: date).components(separatedBy: " ").map{ Int($0)! }
        dateTuple.0 = dateArray[0]
        dateTuple.1 = dateArray[1]
        dateTuple.2 = dateArray[2]
        dateTuple.3 = dateArray[3]
        dateTuple.4 = dateArray[4]
        dateTuple.5 = dateArray[5]
        //for i in 0..<dateArray.count {
        //    dateTuple.i = dateArray[i]
        //}
        return dateTuple
    }
    func stringToDate(date: String) -> Date {
        formatter.dateFormat = "yyyy MM dd"
        let strDate = formatter.date(from: date)  //date(from: String)는 데이트포매터 클래스의 메소드
        return strDate!  //리턴 데이트타입이 옵셔널
    }
    func intToDate(year: Int, month: Int, day: Int) -> Date {
        formatter.dateFormat = "yyyy MM dd"
        let intDate = formatter.date(from: "\(year) \(month) \(day)")
        return intDate!
    }
    func dateToKorean(date: Date) -> String {
        //let dateKorean = formatter.string(from: date).localizedCapitalized
        formatter.dateStyle = .long
        formatter.timeStyle = .long
        formatter.locale = NSLocale(localeIdentifier: "kr_KR") as Locale!
        let dateKorean = formatter.string(from: date)
        return dateKorean
    }
    func dateToday(year: Int, month:Int) -> String {
        components = DateComponents(calendar: calen, year: year, month: month, day: 1)
        date = calen.date(from: components)!
        formatter.dateFormat = "EEE"
        return formatter.string(from: date)
    }
    func dateToArray(week: Int) -> [[Int]] {
        return Array()
    }
}

/*
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
let date = dateFormatter.date(from: String(date))!
let calendar = Calendar.current
let components = calendar.dateComponents([.year, .month, .day, .hour], from: date)
let finalDate = calendar.date(from:components)
return finalDate!
 
dateComponents.day = 4
dateComponents.month = 5
dateComponents.year = 2006
var weekday = Int()
if let gregorianCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian),
let date = gregorianCalendar.date(from: dateComponents) {
weekday = gregorianCalendar.component(.weekday, from: date)
print(String(weekday)) // 5, which corresponds to Thursday in the Gregorian Calendar
 */
