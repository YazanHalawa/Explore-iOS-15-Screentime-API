//
//  MyModel.swift
//  BlockerMonitorExtension
//
//  Created by Yazan Halawa on 7/27/21.
//

import Foundation
import FamilyControls

class MyModel: ObservableObject {
    static let shared = MyModel()

    private init() {}

    var selectionToDiscourage = FamilyActivitySelection() {
        willSet {
            print ("got here \(newValue)")
        }
    }
}
