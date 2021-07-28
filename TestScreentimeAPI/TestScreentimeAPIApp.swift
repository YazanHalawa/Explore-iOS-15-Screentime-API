//
//  TestScreentimeAPIApp.swift
//  TestScreentimeAPI
//
//  Created by Yazan Halawa on 7/27/21.
//

import SwiftUI
import FamilyControls
import DeviceActivity

@main
struct TestScreentimeAPIApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        AuthorizationCenter.shared.requestAuthorization { result in
            switch result {
            case .success:
                let schedule = DeviceActivitySchedule(intervalStart: DateComponents(hour: 0, minute: 0), intervalEnd: DateComponents(hour: 23, minute: 59), repeats: true, warningTime: nil)

                let center = DeviceActivityCenter()
                do {
                    try center.startMonitoring(.daily, during: schedule)
                }
                catch {
                    // do nothing
                }
            case .failure(let error):
                print("error for screentime is \(error)")
            }
        }
        return true
    }
}

extension DeviceActivityName {
    static let daily = Self("daily")
}
