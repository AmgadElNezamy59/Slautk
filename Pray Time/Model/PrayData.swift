//
//  PrayData.swift
//  Pray Time
//
//  Created by Amgad ElNezamy on 04/01/2023.
//

import Foundation

struct PrayData :Codable{
    let data : [Datas]
}




struct Datas :Codable{
    let timings: Timings


}
struct Timings :Codable {
   let Fajr : String
   let Sunrise : String
   let Dhuhr : String
   let Asr : String
   let Maghrib : String
   let Isha : String
}
 


