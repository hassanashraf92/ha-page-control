//
//  VFEPageControlTests.swift
//  
//
//  Created by Hassan Ashraf on 05/03/2023.
//

import XCTest
@testable import VFEPageControl

class VFEPageControlTests: XCTestCase {
    
    var sut: VFEPageControl!
    
    override func setUp() {
        super.setUp()
        sut = VFEPageControl()
        sut.pages = 5
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testInitWithFrame() {
        sut = VFEPageControl(frame: .zero)
        XCTAssertEqual(sut.frame.size, .zero)
    }
    
    func testInitWithCoder() {
        // Given
        let archive = NSKeyedArchiver.archivedData(withRootObject: VFEPageControl())
        let unarchived = NSKeyedUnarchiver.unarchiveObject(with: archive) as? VFEPageControl
        
        // Then
        XCTAssertNotNil(unarchived)
    }

    func testLayoutSubviews() {
        let pageControl = makeSUT()
        
        XCTAssertEqual(pageControl.dotViews.count, 5)
        XCTAssertEqual(pageControl.dotViews[0].frame.size.width, 10)
        XCTAssertEqual(pageControl.dotViews[0].frame.size.height, 10)
        XCTAssertEqual(pageControl.dotViews[0].center.x, 5)
        XCTAssertEqual(pageControl.dotViews[0].center.y, 5)
        
        pageControl.bounds = CGRect(x: 0, y: 0, width: 200, height: 100)
        XCTAssertEqual(pageControl.dotViews.count, 5)
        XCTAssertEqual(pageControl.dotViews[0].frame.size.width, 10)
        XCTAssertEqual(pageControl.dotViews[0].frame.size.height, 10)
        XCTAssertEqual(pageControl.dotViews[0].center.x, 5)
        XCTAssertEqual(pageControl.dotViews[0].center.y, 5)
        
    }

    func testNumberOfPages() {
        XCTAssertEqual(sut.pages, 5)
    }
    
    func testSelectedPage() {
        sut.selectedPage = 2
        XCTAssertEqual(sut.selectedPage, 2)
        
        sut.selectedPage = 7
        XCTAssertEqual(sut.selectedPage, 4)
    }
    
    func testMaxDots() {
        sut.maxDots = 10
        XCTAssertEqual(sut.maxDots, 11)
        
        sut.maxDots = 3
        XCTAssertEqual(sut.maxDots, 3)
    }
    
    func testCenterDots() {
        sut.centerDots = 0
        XCTAssertEqual(sut.centerDots, 1)
        
        sut.centerDots = 2
        XCTAssertEqual(sut.centerDots, 3)
        
        sut.centerDots = 3
        XCTAssertEqual(sut.centerDots, 3)
        
        sut.centerDots = 3
        sut.maxDots = 2
        XCTAssertEqual(sut.centerDots, 3)
    }
    
    func testDotSize() {
        sut.dotSize = 10
        XCTAssertEqual(sut.dotSize, 10)
    }
    
    func testSpacing() {
        sut.spacing = 10
        XCTAssertEqual(sut.spacing, 10)
    }
    
    func testCreateViews() {
        XCTAssertEqual(sut.dotViews.count, 5)
    }
    
    func testUpdateColors() {
        sut.selectedColor = .red
        sut.dotColor = .lightGray
        sut.selectedPage = 2
        
        sut.dotViews = [UIView(), UIView(), UIView(), UIView(), UIView()]
        
        XCTAssertEqual(sut.dotViews[0].tintColor, UIColor.lightGray)
        XCTAssertEqual(sut.dotViews[1].tintColor, UIColor.lightGray)
        XCTAssertEqual(sut.dotViews[2].tintColor, UIColor.red)
        XCTAssertEqual(sut.dotViews[3].tintColor, UIColor.lightGray)
        XCTAssertEqual(sut.dotViews[4].tintColor, UIColor.lightGray)
    }
    
    func testUpdatePositions_WithThreeItems() {
        sut.pages = 3
        sut.centerDots = 3
        sut.maxDots = 3
        
        sut.dotSize = 10
        sut.spacing = 5
        sut.bounds = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        // Call the updatePositions method
        sut.updatePositions()
        
        // Check that the dot views have been updated correctly
        XCTAssertEqual(sut.dotViews.count, 3)
        XCTAssertEqual(sut.dotViews[0].frame.size.width, 10)
        XCTAssertEqual(sut.dotViews[0].frame.size.height, 10)
        XCTAssertEqual(sut.dotViews[0].center.x, 35)
        XCTAssertEqual(sut.dotViews[0].center.y, 25)
        XCTAssertEqual(sut.dotViews[1].frame.size.width, 10)
        XCTAssertEqual(sut.dotViews[1].frame.size.height, 10)
        XCTAssertEqual(sut.dotViews[1].center.x, 50, accuracy: 0.1)
        XCTAssertEqual(sut.dotViews[1].center.y, 25)
        XCTAssertEqual(sut.dotViews[2].frame.size.width, 10)
        XCTAssertEqual(sut.dotViews[2].frame.size.height, 10)
        XCTAssertEqual(sut.dotViews[2].center.x, 65, accuracy: 0.1)
        XCTAssertEqual(sut.dotViews[2].center.y, 25)
    }
    
    func testUpdatePositions_WithMoreThanThreeItems() {
        
        // Set up the VFEPageControl with some sample data
        sut.pages = 5
        sut.centerDots = 3
        sut.maxDots = 5
        
        sut.dotSize = 10
        sut.spacing = 5
        sut.bounds = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        // Call the updatePositions method
        sut.updatePositions()
        
        // Check that the dot views have been updated correctly
        XCTAssertEqual(sut.dotViews.count, 5)
        XCTAssertEqual(sut.dotViews[0].frame.size.width, 10)
        XCTAssertEqual(sut.dotViews[0].frame.size.height, 10)
        XCTAssertEqual(sut.dotViews[0].center.x, 35)
        XCTAssertEqual(sut.dotViews[0].center.y, 25)
        XCTAssertEqual(sut.dotViews[1].frame.size.width, 10)
        XCTAssertEqual(sut.dotViews[1].frame.size.height, 10)
        XCTAssertEqual(sut.dotViews[1].center.x, 50, accuracy: 0.1)
        XCTAssertEqual(sut.dotViews[1].center.y, 25)
        XCTAssertEqual(sut.dotViews[2].frame.size.width, 10)
        XCTAssertEqual(sut.dotViews[2].frame.size.height, 10)
        XCTAssertEqual(sut.dotViews[2].center.x, 65, accuracy: 0.1)
        XCTAssertEqual(sut.dotViews[2].center.y, 25)
        XCTAssertEqual(sut.dotViews[3].frame.size.width, 6.6, accuracy: 0.1)
        XCTAssertEqual(sut.dotViews[3].frame.size.height, 6.6, accuracy: 0.1)
        XCTAssertEqual(sut.dotViews[4].frame.size.width, 0)
        XCTAssertEqual(sut.dotViews[4].frame.size.height, 0)
    }
    
    func testScrollingPageControlDelegate_isSet() {
        let delegate = MockScrollingPageControlDelegate()
        sut.delegate = delegate
        XCTAssertTrue(sut.subviews.count > 0, "createViews() method should be called after delegate property is set")
        XCTAssertEqual(sut.subviews.count, 5)
        XCTAssertEqual(sut.subviews[0].backgroundColor, .red)
        XCTAssertEqual(sut.subviews[1].backgroundColor, .lightGray)
        XCTAssertEqual(sut.subviews[2].backgroundColor, .lightGray)
        XCTAssertEqual(sut.subviews[3].backgroundColor, .lightGray)
        XCTAssertEqual(sut.subviews[4].backgroundColor, .lightGray)
        XCTAssertEqual(sut.subviews[0].layer.cornerRadius, 5)
    }
    
    // MARK: - Helper Functions
    func makeSUT() -> VFEPageControl {
        let pageControl = VFEPageControl(frame: .zero)
        pageControl.pages = 5
        pageControl.centerDots = 3
        pageControl.maxDots = 5
        pageControl.dotSize = 10
        pageControl.spacing = 5
        pageControl.bounds = .zero
        return pageControl
    }
    
}
