//
//  TestScrollingPageControlDelegate.swift
//  
//
//  Created by Hassan Ashraf on 16/03/2023.
//

import XCTest
@testable import VFEPageControl

class MockScrollingPageControlDelegate: ScrollingPageControlDelegate {
    func viewForDot(at index: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        if index == 0 {
            view.backgroundColor = .red
            view.layer.cornerRadius = 5
        } else {
            view.backgroundColor = .lightGray
            view.layer.cornerRadius = 5
        }
        
        return view
    }
}


