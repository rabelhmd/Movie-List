//
//  Global.swift
//  Movies
//
//  Created by Rabel Ahmed  on 21/9/22.
//

import Foundation

func printIfDebug(_ string: String) {
    #if DEBUG
    print(string)
    #endif
}


class Thread {
    
    fileprivate init() {}
    
    public static func main(completion: @escaping () -> ()){
        delay(bySeconds: 0,completion: completion)
    }
    
    public static func background(completion: @escaping () -> ()){
        delay(bySeconds: 0,dispatchLevel: .background,completion: completion)
    }
    
    
    public static func delay(bySeconds seconds: Double, dispatchLevel: DispatchLevel = .main, completion: @escaping () -> ()) {
        let dispatchTime = DispatchTime.now() + seconds
        dispatchLevel.dispatchQueue.asyncAfter(deadline: dispatchTime, execute: completion)
    }
    
    
    public enum DispatchLevel {
        case main, userInteractive, userInitiated, utility, background
        var dispatchQueue: DispatchQueue {
            switch self {
            case .main:         return DispatchQueue.main
            case .userInteractive:   return DispatchQueue.global(qos: .userInteractive)
            case .userInitiated:    return DispatchQueue.global(qos: .userInitiated)
            case .utility:       return DispatchQueue.global(qos: .utility)
            case .background:      return DispatchQueue.global(qos: .background)
            }
        }
    }
}
