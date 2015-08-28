//
//  TravelModel.swift
//  WorkAngel-Sorter
//
//  Created by Vincenzo Favara on 27/08/15.
//  Copyright (c) 2015 Vincenzo Favara (VinSoft). All rights reserved.
//

import Foundation

class TravelModel{
    
    /*
    Take train 78A from Madrid to Barcelona. Sit in seat 45B.
    Take the airport bus from Barcelona to Gerona Airport. No seat assignment.
    From Gerona Airport, take flight SK455 to London. Gate 45B, seat 3A. Baggage
    From London, take flight SK22 to New York JFK. Gate 22, seat 7B. Baggage will we
    */
    
    func getTravels() -> [Travel]{
        
        var travels : [Travel] = []
        
        travels.append(Travel(myCityFrom: "Madrid", myCityTo: "Barcelona", myTypeTrasport: "Train 78A", myPlace: "45B"))
        
        travels.append(Travel(myCityFrom: "Barcelona", myCityTo: "Gerona Airport", myTypeTrasport: "Bus", myPlace: ""))
        
        travels.append(Travel(myCityFrom: "Gerona Airport", myCityTo: "London", myTypeTrasport: "Flight SK455", myPlace: "3A"))
        
        travels.append(Travel(myCityFrom: "London", myCityTo: "New York JFK", myTypeTrasport: "Flight SK22", myPlace: "7B"))
        
        return shuffleTravels(travels)
    }
    
    func shuffleTravels(var list: [Travel]) -> [Travel] {
        START_MEASURE_EXECUTION()
        for i in 0..<list.count {
            let j = Int(arc4random_uniform(UInt32(list.count - i))) + i
            list.insert(list.removeAtIndex(j), atIndex: i)
        }
        STOP_MEASURE_EXECUTION()
        return list
    }
    
    func sortTravels(var list: [Travel]) -> [Travel] {
        START_MEASURE_EXECUTION()
/*
        //TODO: sort array

        cd
        bc
        de
        ab
*/
        
        STOP_MEASURE_EXECUTION()
        return list
    }
    
    
    // MARK: Measure time execution
    
    var startTime = NSDate()
    func START_MEASURE_EXECUTION(){ startTime =  NSDate() }
    func STOP_MEASURE_EXECUTION(function: String = __FUNCTION__, line: Int = __LINE__){
        println("\(function) Time: \(startTime.timeIntervalSinceNow) Line:\(line)")
    }
    
}