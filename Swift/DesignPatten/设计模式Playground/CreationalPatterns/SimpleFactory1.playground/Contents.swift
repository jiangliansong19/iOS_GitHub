//: Playground - noun: a place where people can play

import UIKit


enum EncryptionLevel: Int {
    case cookie = 1
    case token = 2
    case AES = 3
    case RSA = 4
}

protocol EncryptionProtocol {
    func encrypt(_ data:String) -> String
}
class CookieEncryption: EncryptionProtocol {
    func encrypt(_ data: String) -> String {
        return "cookie-\(data)-cookie"
    }
}
class TokenEncryption: EncryptionProtocol {
    func encrypt(_ data: String) -> String {
        return "token-\(data)-token"
    }
}
class AESEncryption: EncryptionProtocol {
    func encrypt(_ data: String) -> String {
        return "AES-\(data)-AES"
    }
}
class RSAEncryption: EncryptionProtocol {
    func encrypt(_ data: String) -> String {
        return "RSA-\(data)-RSA"
    }
}

class EncryptionFactory {
    static func getEncryption(_ level: EncryptionLevel) -> EncryptionProtocol {
        switch level {
        case .cookie:
            return CookieEncryption()
        case .token:
            return TokenEncryption()
        case .AES:
            return AESEncryption()
        case .RSA:
            return RSAEncryption()
        }
    }
}


let encryption = EncryptionFactory.getEncryption(.AES)
let obj = encryption.encrypt("jiangliansong")
print("加密后为:\(obj)")