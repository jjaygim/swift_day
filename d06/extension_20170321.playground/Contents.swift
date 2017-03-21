//: Playground - noun: a place where people can play

import UIKit

extension String {
    func filterHangulWord() -> Array<String> {
        //(Array(cafe.characters))
        let chaArr = Array(self.characters)
        var strArr = [String]()

        var korArr = [String]()
        var temp = ""
        
        for i in chaArr {
            strArr.append(String(i))
        }

        for i in 0..<strArr.count {
            
            if strArr[i].unicodeScalars >= "ㄱ".unicodeScalars.first! || strArr[i] >= "힣".unicodeScalars.first! {
                temp += strArr[i]
                if !(strArr[i+1].unicodeScalars >= "ㄱ".unicodeScalars.first! || strArr[i+1] >= "힣".unicodeScalars.first!) {
                    korArr.append(temp)
                    temp = ""
                }
            }
        }
        return korArr
    }
}


let word = "http://www.osxdev.org/forum/index.php?threads/swift-2-0에서-try-catch로-fatal- error-잡을-수-있나요.382/"
let link = "http://www.osxdev.org/forum/index.php?threads/swift-2-0에서 try catch로-fatal- error-잡을-수-있나요.382/"

extension String {
    var length : Int {
        return self.characters.count
    }
    
    func filterKoreanWord() -> [String] {
        let stringArray = self.components(separatedBy: "-")
        var tempArray = [String]()
        
        for item in stringArray {
            var temp = ""
            for i in item.unicodeScalars {
                if i >= "ㄱ".unicodeScalars.first! || i >= "힣".unicodeScalars.first! {
                    //                if i.value >= 12593 || i.value >= 55203 {
                    let tempString = String(i)
                    temp += tempString
                }
            }
            if temp.isEmpty == false {
                tempArray.append(temp)
            }
        }
        return tempArray
    }
}

print(word.filterKoreanWord())
print(link.filterKoreanWord())

//print(link.filterHangulWord())



//[모든 유니코드표 : http://www.unicode.org/charts/]
//[출처:http://mwultong.blogspot.com/2006/08/perl-11172-unicode-utf-8.html]
//
//범위별 유니코드 :  http://codeartist.tistory.com/72
//U+0041-U+005A,    /* Upper-Case [A..Z] */
//U+0061-U+007A,    /* Lower-Case a-z */
//U+0021-U+002F,    /* !,",#,$,%,',(,),*,+,,,-,.,/ */
//U+0030-U+0039,    /* Numbers [0..9] */
//U+002E-U+002E,    /* Period [.] */
//U+260E-U+260F,    /* ☎,☏ */
//U+3131-U+3163,    /* 자음,모음*/
//U+AC00-U+D7A3,    /* 한글 */
//
//한글전체 : U+AC00 ~ U+D7A3
//
//[Perl] 유니코드의 한글 낱자 11172자를 코드 번호와 함께 파일로 출력하기 - Unicode UTF-8


