//
//  ContentView.swift
//  SnapchatLoginDemo
//
//  Created by Alek Michelson on 10/23/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MyView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MyView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        let vc = ViewController()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
    }
}
