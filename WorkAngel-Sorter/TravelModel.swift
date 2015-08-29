//
//  TravelModel.swift
//  WorkAngel-Sorter
//
//  Created by Vincenzo Favara on 27/08/15.
//  Copyright (c) 2015 Vincenzo Favara (VinSoft). All rights reserved.
//

import Foundation

class TravelModel{
    
    var listSorted: [Travel] = []
    
    
    func getTravels() -> [Travel]{
        
        /*
        Take train 78A from Madrid to Barcelona. Sit in seat 45B.
        Take the airport bus from Barcelona to Gerona Airport. No seat assignment.
        From Gerona Airport, take flight SK455 to London. Gate 45B, seat 3A. Baggage
        From London, take flight SK22 to New York JFK. Gate 22, seat 7B. Baggage will we
        */
        
        var travels : [Travel] = []
        
        travels.append(Travel(myCityFrom: "Madrid", myCityTo: "Barcelona", myTypeTrasport: "Train 78A", myPlace: "45B"))
        
        travels.append(Travel(myCityFrom: "Barcelona", myCityTo: "Gerona Airport", myTypeTrasport: "Bus", myPlace: ""))
        
        travels.append(Travel(myCityFrom: "Gerona Airport", myCityTo: "London", myTypeTrasport: "Flight SK455", myPlace: "3A"))
        
        travels.append(Travel(myCityFrom: "London", myCityTo: "New York JFK", myTypeTrasport: "Flight SK22", myPlace: "7B"))
        
        
        travels.append(Travel(myCityFrom: "New York JFK", myCityTo: "Roma", myTypeTrasport: "Flight Ali87", myPlace: "H24"))
        travels.append(Travel(myCityFrom: "Roma", myCityTo: "Bangkok", myTypeTrasport: "Flight RY34", myPlace: "9B"))
        travels.append(Travel(myCityFrom: "Bangkok", myCityTo: "Milano", myTypeTrasport: "Cycle BMX", myPlace: ""))
        travels.append(Travel(myCityFrom: "Milano", myCityTo: "Hongkong", myTypeTrasport: "Boat Titanic", myPlace: "13"))
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
        cd
        bc
        de
        ab
*/
        
        var dict : Dictionary<String,String> = [:]
        
        // O(n) - prepare dictionary and set value
        for h in 0..<list.count {
            dict[list[h].cityFrom] = list[h].cityTo
        }
        
        // O(n) - determinate the first elemnt
        for j in 0..<list.count {
            
            //enter only once
            if !(Set(dict.values.array).contains(list[j].cityFrom)){
                println("First is: From " + list[j].cityFrom + " To " + list[j].cityTo + " with index \(j) \n")
                listSorted.append(list.removeAtIndex(j))
                findNext(list)
                break
            }
        }
        
        STOP_MEASURE_EXECUTION()
        return listSorted
    }
    
    //O(n!)
    func findNext(var list: [Travel]){
        
        //using the first element like a start trip
        for k in 0..<list.count {
            if(listSorted.last!.cityTo == list[k].cityFrom){
                println("Last in sorted list: " + listSorted.last!.cityTo)
                println("Next is: From " + list[k].cityFrom + " To " + list[k].cityTo + " with index \(k) \n")
                listSorted.append(list.removeAtIndex(k))
                findNext(list)
                
                //I find it so break
                break
            }
        }
    }
    
    
    // MARK: Measure time execution
    
    var startTime = NSDate()
    func START_MEASURE_EXECUTION(){ startTime =  NSDate() }
    func STOP_MEASURE_EXECUTION(function: String = __FUNCTION__, line: Int = __LINE__){
        println("\(function) Time: \(startTime.timeIntervalSinceNow) Line:\(line)")
    }
    
}