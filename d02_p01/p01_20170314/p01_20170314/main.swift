//
//  main.swift
//  p01_20170314
//
//  Created by 김재정 on 2017. 3. 14..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import Foundation

let pen01 = CXPen(withBrand: "sharp")
pen01.setColor("red")
let pen02 = CXPen(withBrand: "sharp")
pen02.setColor("red")
let pen03 = CXPen(withBrand: "sharp")
pen03.setColor("blue")
let pen04 = CXPen(withBrand: "sharp")
pen04.setColor("blue")
let pen05 = CXPen(withBrand: "sharp")
pen05.setColor("blue")
let pen06 = CXPen(withBrand: "sharp")
pen06.setColor("blue")
let pen07 = CXPen(withBrand: "sharp")
pen07.setColor("black")
let pen08 = CXPen(withBrand: "sharp")
pen08.setColor("black")
let pen09 = CXPen(withBrand: "sharp")
pen09.setColor("black")
let pen10 = CXPen(withBrand: "sharp")
pen10.setColor("black")

let penHolder01 = PenHolder(withcapacity: 100)
penHolder01.add(pen: pen01)
penHolder01.add(pen: pen02)
penHolder01.add(pen: pen03)
penHolder01.add(pen: pen04)
penHolder01.add(pen: pen05)
penHolder01.add(pen: pen06)
penHolder01.add(pen: pen07)
penHolder01.add(pen: pen08)
penHolder01.add(pen: pen09)
penHolder01.add(pen: pen10)
penHolder01.remove(penIndex: 3)
penHolder01.printDescription()

let fileM = FileMatcher()
let allFilesArr = try fileM.allFiles(atPath: "/Users/JjGim/Desktop/CodeSquad")
dump(allFilesArr)
print(allFilesArr)
print(try fileM.allFiles(atPath: "/Users/JjGim/Desktop/CodeSquad"))
print(fileM.isExist(filename: "120303김재정_스캔.jpg", atPath: "/Users/JjGim/Desktop/CodeSquad"))
print(fileM.isExist(filename: "코드스쿼드.jpg", atPath: "/Users/JjGim/Desktop/CodeSquad"))

let pen11 = CXMonamiBlackPen()
pen11.printDescription()

let pen12 = CXSharpPen(withModel: "미정")
pen12.printDescription()
