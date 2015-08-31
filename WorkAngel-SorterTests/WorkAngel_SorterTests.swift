//
//  WorkAngel_SorterTests.swift
//  WorkAngel-SorterTests
//
//  Created by Vincenzo Favara on 27/08/15.
//  Copyright (c) 2015 Vincenzo Favara (VinSoft). All rights reserved.
//

import UIKit
import XCTest

class WorkAngel_SorterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSortTravels(){
        let travelModel : TravelModel = TravelModel()
        let travels : [Travel] = travelModel.getTravels()
        
        self.measureBlock() {
            travelModel.sortTravels(travels)
        }
        XCTAssert(true, "Passed testSortTravels")
    }
}
