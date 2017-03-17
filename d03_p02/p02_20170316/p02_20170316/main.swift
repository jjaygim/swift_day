//
//  main.swift
//  p02_20170316
//
//  Created by 김재정 on 2017. 3. 16..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import Foundation

let timePrint = MyCalendar()
print(timePrint.makeTodayTuple())
print(timePrint.stringToDate(date: "2016 11 30"))
print(timePrint.intToDate(year: 2017, month: 03, day: 01))
print(timePrint.dateToday(year: 2017, month: 04))

let date = Date()
print(timePrint.dateToKorean(date: date))  //--; ?? 현재는 한글인데 코드 위치 옮기면 영어로 나옴
