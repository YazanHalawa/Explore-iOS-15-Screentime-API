//
//  ContentView.swift
//  TestScreentimeAPI
//
//  Created by Yazan Halawa on 7/27/21.
//

import SwiftUI
import FamilyControls

struct ContentView: View {
    @StateObject var model = MyModel.shared
    @State var isPresented = false
    
    var body: some View {
        Button("Select Apps to Discourage") {
            isPresented = true
        }
        .familyActivityPicker(isPresented: $isPresented, selection: $model.selectionToDiscourage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
