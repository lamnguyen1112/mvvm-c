import Foundation

enum SecretKeys {
 private static let salt: [UInt8] = [
      98, 52, 120, 78, 76, 54, 113, 54, 104, 50, 
      77, 120, 110, 87, 110, 48, 80, 54, 101, 67, 
      87, 51, 101, 54, 78, 48, 69, 71, 72, 100, 
      68, 81, 
 ]
 static var example: String {
     let encoded: [UInt8] = [
        7, 76, 25, 35, 60, 90, 20, 96, 9, 94, 
        56, 29, 
     ]
     return decode(encoded, cipher: salt)
 }
 
 static func decode(_ encoded: [UInt8], cipher: [UInt8]) -> String {
   String(decoding: encoded.enumerated().map { offset, element in
     element ^ cipher[offset % cipher.count]
   }, as: UTF8.self)
 }
}