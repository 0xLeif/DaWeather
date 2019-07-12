//
//  LoadingView.swift
//  DaWeather
//
//  Created by Zach Eriksen on 7/12/19.
//  Copyright © 2019 Zach Eriksen. All rights reserved.
//

import SwiftUI
import UIKit

struct LoadingView : UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView()
        indicator.color = .yellow
        indicator.startAnimating()
        return indicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        print("it")
    }
}

