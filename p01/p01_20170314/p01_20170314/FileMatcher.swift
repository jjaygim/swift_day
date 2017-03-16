//
//  FileMatcher.swift
//  p01_20170314
//
//  Created by 김재정 on 2017. 3. 14..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import Foundation

class FileMatcher {
    func allFiles(atPath: String) throws -> [String] {
        let files = try FileManager.default.contentsOfDirectory(atPath: atPath)
        return files
    }
    func isExist(filename: String, atPath: String) -> Bool {
        let exist = FileManager.default.fileExists(atPath: atPath+"/"+filename)
        return exist
    }
}








/*
 let fm = FileManager.default
 let path = Bundle.main.resourcePath!
 let items = try! fm.contentsOfDirectory(atPath: path)
 
 for item in items {
     if item.hasPrefix("nssl") {
     // this is a picture to load!
     }
 }
 
let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

do {
    // Get the directory contents urls (including subfolders urls)
    let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil, options: [])
    print(directoryContents)
    
    // if you want to filter the directory contents you can do like this:
    let mp3Files = directoryContents.filter{ $0.pathExtension == "mp3" }
    print("mp3 urls:",mp3Files)
    let mp3FileNames = mp3Files.map{ $0.deletingPathExtension().lastPathComponent }
    print("mp3 list:", mp3FileNames)
    
} catch let error as NSError {
    print(error.localizedDescription)
}
*/
