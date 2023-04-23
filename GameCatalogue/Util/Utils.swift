//
//  Utils.swift
//  GameCatalogue
//
//  Created by Haris Asrofi on 27/12/22.
//

import Foundation

func minutesToHoursAndMinutes(_ minutes: Int) -> (String) {
    return String(format: "%02d:%02d", (minutes / 60), (minutes % 60))
    
}
