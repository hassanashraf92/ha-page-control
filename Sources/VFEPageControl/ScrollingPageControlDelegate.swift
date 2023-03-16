//
//  ScrollingPageControlDelegate.swift
//  
//
//  Created by Hassan Ashraf on 16/03/2023.
//

import UIKit

public protocol ScrollingPageControlDelegate: AnyObject {
    //    If delegate is nil or the implementation returns nil for a given dot, the default
    //    circle will be used. Returned views should react to having their tint color changed
    func viewForDot(at index: Int) -> UIView?
}
