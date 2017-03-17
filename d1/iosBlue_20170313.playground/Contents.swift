//: Playground - noun: a place where people can play

import UIKit  //유아이킷은 아이오에스용 파운데이션은 맥용

var str = "Hello, playground"

1+2
12-34
5*6
78/9
10%3

/*
func makeLadder(garo: Int, sero: Int) -> Array<Array<Bool>> {
    var sadariArr : Array<Array<Bool>> = [[Bool]]()
    for _ in 1...sero {
    var makeArr : [Bool] = []
        for _ in 1...garo {
            makeArr.append(arc4random_uniform(2) == 1)
        }
        sadariArr.append(makeArr)
    }
    return sadariArr
}

func printLadder(sadari: Array<Array<Bool>>) {
    for i in 0..<sadari.count {
        print("|",terminator:"")
        for j in 0..<sadari[i].count {
            if sadari[i][j] == true {
                print("-|",terminator:"")
            }
            else {
                print(" |",terminator:"")
            }
        }
        print()
    }
}

printLadder(sadari: makeLadder(garo: 5, sero: 5))
*/

func makeLadder(garo: Int, sero: Int) -> Array<Array<Int>> {
    var sadariArr : Array<Array<Int>> = [[Int]]()
    for _ in 1...sero {
        var makeArr : [Int] = []
        for _ in 1...garo {
            if Int(arc4random()%6) == 0 || Int(arc4random()%6) == 1 {
                makeArr.append(0)
            }
            else if Int(arc4random()%6) == 2 {
                makeArr.append(1)
            }
            else if Int(arc4random()%6) == 3 {
                makeArr.append(2)
            }
            else {
                makeArr.append(3)
            }
            
            
            
        }
        sadariArr.append(makeArr)
    }
    return sadariArr
}

func printLadder(sadari: Array<Array<Int>>) {
    for i in 0..<sadari.count {
        print("|",terminator:"")
        for j in 0..<sadari[i].count {
            if sadari[i][j] == 0 {
                print("-|",terminator:"")
            }
            else if sadari[i][j] == 1 {
                print("/|",terminator:"")
            }
            else if sadari[i][j] == 2 {
                print("\\|",terminator:"")
            }
            else {
                print(" |",terminator:"")
            }
        }
        print()
    }
}

printLadder(sadari: makeLadder(garo: 5, sero: 5))


