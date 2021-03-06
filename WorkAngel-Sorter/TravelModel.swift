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
        for i in 0..<list.count {
            let j = Int(arc4random_uniform(UInt32(list.count - i))) + i
            list.insert(list.removeAtIndex(j), atIndex: i)
        }
        return list
    }
    
    func sortTravels(let list: [Travel]) -> [Travel] {
/*
        cd
        bc
        de
        ab
*/
 
/*
        //OLD Method bad performance
        var dict : Dictionary<String,String> = [:]
        
        // O(n) - prepare dictionary and set value
        for h in 0..<list.count {
            dict[list[h].cityFrom] = list[h].cityTo
        }
        
        // O(n) - determinate the first elemnt
        for j in 0..<list.count {
            
            //enter only once
            if !(Set(dict.values.array).contains(list[j].cityFrom)){
                print("First is: From " + list[j].cityFrom + " To " + list[j].cityTo + " with index \(j) \n")
                listSorted.append(list.removeAtIndex(j))
                findNext(list)
                break
            }
        }
*/
        //New Method
        let set = Set(list)
        
        listSorted = sort(set)
        
        return listSorted
    }
/*
    private func findNext(var list: [Travel]){
        
        //using the first element like a start trip
        for k in 0..<list.count {
            if(listSorted.last!.cityTo == list[k].cityFrom){
                print("Last in sorted list: " + listSorted.last!.cityTo)
                print("Next is: From " + list[k].cityFrom + " To " + list[k].cityTo + " with index \(k) \n")
                listSorted.append(list.removeAtIndex(k))
                findNext(list)
                
                //I find it so break
                break
            }
        }
    }
*/
    private func sort<T: Travel>(set:Set<T>) -> Array<T> {
        
        // Sets of cities
        var fromCitySet : Set<String> = []
        var toCitySet : Set<String> = []
        // Dictionaries of travel
        var fromDictionary : [String : T] = [:]
        var toDictionary : [String : T] = [:]
        
        // fill model data
        for travel in set {
            fromCitySet.insert(travel.cityFrom)
            toCitySet.insert(travel.cityTo)
            fromDictionary[travel.cityFrom] = travel
            toDictionary[travel.cityTo] = travel
        }
        
        // Determine start and end
        let startEndCities = fromCitySet.exclusiveOr(toCitySet)
        var startTravel : T?
        var endTravel : T?
        
        for city in startEndCities {
            // if start citiy is in fromDictionary, we will have the start
            if let pass = fromDictionary[city] {
                startTravel = pass
                print("Start travel: " + city)
            }
            
            if let pass = toDictionary[city] {
                endTravel = pass
                print("End travel: " + city)
            }
        }

        // Let's start the journey
        var journey: Array<T> = []
        var pass = startTravel!
        while pass != endTravel! {
            let newTravel = fromDictionary[pass.cityTo]
            if let newPass = newTravel {
                journey.append(pass)
                pass = newPass
            }
            print("Travel= from: " + pass.cityFrom + "  to: " + pass.cityTo)
        }
        journey.append(endTravel!)
        
        return journey
    }
    
}