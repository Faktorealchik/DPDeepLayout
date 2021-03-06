//
//  Device.swift
//  DeepLayout
//
//  Created by Alexandr Nesterov on 9/10/18.
//  Copyright © 2018 Alexandr Nesterov. All rights reserved.
//

public class DPDevice {
    static fileprivate func getVersionCode() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let versionCode = String(
            validatingUTF8: NSString(bytes: &systemInfo.machine,
                                     length: Int(_SYS_NAMELEN),
                                     encoding: String.Encoding.ascii.rawValue)!.utf8String!
            )!
        
        return versionCode
    }
    
    static fileprivate func getVersion(code: String) -> DPVersion {
        switch code {
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":      return .iPhone4
        case "iPhone4,1", "iPhone4,2", "iPhone4,3":      return .iPhone4S
        case "iPhone5,1", "iPhone5,2":                   return .iPhone5
        case "iPhone5,3", "iPhone5,4":                   return .iPhone5C
        case "iPhone6,1", "iPhone6,2":                   return .iPhone5S
        case "iPhone7,2":                                return .iPhone6
        case "iPhone7,1":                                return .iPhone6Plus
        case "iPhone8,1":                                return .iPhone6S
        case "iPhone8,2":                                return .iPhone6SPlus
        case "iPhone8,4":                                return .iPhoneSE
        case "iPhone9,1", "iPhone9,3":                   return .iPhone7
        case "iPhone9,2", "iPhone9,4":                   return .iPhone7Plus
        case "iPhone10,1", "iPhone10,4":                 return .iPhone8
        case "iPhone10,2", "iPhone10,5":                 return .iPhone8Plus
        case "iPhone10,3", "iPhone10,6":                 return .iPhoneX
            
        case "iPad1,1":                                  return .iPad1
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": return .iPad2
        case "iPad3,1", "iPad3,2", "iPad3,3":            return .iPad3
        case "iPad3,4", "iPad3,5", "iPad3,6":            return .iPad4
        case "iPad6,11", "iPad6,12":                     return .iPad5
        case "iPad4,1", "iPad4,2", "iPad4,3":            return .iPadAir
        case "iPad5,3", "iPad5,4":                       return .iPadAir2
        case "iPad2,5", "iPad2,6", "iPad2,7":            return .iPadMini
        case "iPad4,4", "iPad4,5", "iPad4,6":            return .iPadMini2
        case "iPad4,7", "iPad4,8", "iPad4,9":            return .iPadMini3
        case "iPad5,1", "iPad5,2":                       return .iPadMini4
        case "iPad6,7", "iPad6,8", "iPad7,1", "iPad7,2": return .iPadPro12_9Inch
        case "iPad7,3", "iPad7,4":                       return .iPadPro10_5Inch
        case "iPad6,3", "iPad6,4":                       return .iPadPro9_7Inch
            
        case "iPod1,1":                                  return .iPodTouch1Gen
        case "iPod2,1":                                  return .iPodTouch2Gen
        case "iPod3,1":                                  return .iPodTouch3Gen
        case "iPod4,1":                                  return .iPodTouch4Gen
        case "iPod5,1":                                  return .iPodTouch5Gen
        case "iPod7,1":                                  return .iPodTouch6Gen
            
        case "i386", "x86_64":                           return .simulator
            
        default:                                         return .unknown
        }
    }
    
    static fileprivate func getType(code: String) -> DPType {
        let versionCode = getVersionCode()
        
        if versionCode.contains("iPhone") {
            return .iPhone
        } else if versionCode.contains("iPad") {
            return .iPad
        } else if versionCode.contains("iPod") {
            return .iPod
        } else if versionCode == "i386" || versionCode == "x86_64" {
            return .simulator
        } else {
            return .unknown
        }
    }
    
    public static func version() -> DPVersion {
        return getVersion(code: getVersionCode())
    }
    
    public static func size() -> DPSize {
        let w: Double = Double(UIScreen.main.bounds.width)
        let h: Double = Double(UIScreen.main.bounds.height)
        let screenHeight: Double = max(w, h)
        
        switch screenHeight {
        case 480:
            return .screen3_5Inch
        case 568:
            return .screen4Inch
        case 667:
            return UIScreen.main.scale == 3.0 ? .screen5_5Inch : .screen4_7Inch
        case 736:
            return .screen5_5Inch
        case 812:
            return .screen5_8Inch
        case 1024:
            switch version() {
            case .iPadMini,.iPadMini2,.iPadMini3,.iPadMini4:
                return .screen7_9Inch
            case .iPadPro10_5Inch:
                return .screen10_5Inch
            default:
                return .screen9_7Inch
            }
        case 1112:
            return .screen10_5Inch
        case 1366:
            return .screen12_9Inch
        default:
            return .unknownSize
        }
    }
    
    public static func type() -> DPType {
        return getType(code: getVersionCode())
    }
    
    public static func isRetina() -> Bool {
        return UIScreen.main.scale > 1.0
    }
    
    public static func isPad() -> Bool {
        return type() == .iPad
    }
    
    public static func isPhone() -> Bool {
        return type() == .iPhone
    }
    
    public static func isPod() -> Bool {
        return type() == .iPod
    }
    
    public static func isSimulator() -> Bool {
        return type() == .simulator
    }
}

public enum DPVersion: String {
    case iPhone4
    case iPhone4S
    case iPhone5
    case iPhone5C
    case iPhone5S
    case iPhone6
    case iPhone6Plus
    case iPhone6S
    case iPhone6SPlus
    case iPhoneSE
    case iPhone7
    case iPhone7Plus
    case iPhone8
    case iPhone8Plus
    case iPhoneX
    
    case iPad1
    case iPad2
    case iPad3
    case iPad4
    case iPad5
    case iPadAir
    case iPadAir2
    case iPadMini
    case iPadMini2
    case iPadMini3
    case iPadMini4
    case iPadPro9_7Inch
    case iPadPro10_5Inch
    case iPadPro12_9Inch
    
    case iPodTouch1Gen
    case iPodTouch2Gen
    case iPodTouch3Gen
    case iPodTouch4Gen
    case iPodTouch5Gen
    case iPodTouch6Gen
    
    case simulator
    
    case unknown
}

public enum DPType: String {
    #if os(iOS)
    case iPhone
    case iPad
    case iPod
    case simulator
    #elseif os(OSX)
    case iMac
    case macMini
    case macPro
    case macBook
    case macBookAir
    case macBookPro
    case xserve
    #endif
    case unknown
}

public enum DPSize: Int, Comparable {
    case unknownSize = 0
    #if os(iOS)
    case screen3_5Inch
    case screen4Inch
    case screen4_7Inch
    case screen5_5Inch
    case screen5_8Inch
    case screen7_9Inch
    case screen9_7Inch
    case screen10_5Inch
    case screen12_9Inch
    #elseif os(OSX)
    case screen11Inch
    case screen12Inch
    case screen13Inch
    case screen15Inch
    case screen17Inch
    case screen20Inch
    case screen21_5Inch
    case screen24Inch
    case screen27Inch
    #endif
}

public func <(lhs: DPSize, rhs: DPSize) -> Bool {
    return lhs.rawValue < rhs.rawValue
}

public func ==(lhs: DPSize, rhs: DPSize) -> Bool {
    return lhs.rawValue == rhs.rawValue
}
