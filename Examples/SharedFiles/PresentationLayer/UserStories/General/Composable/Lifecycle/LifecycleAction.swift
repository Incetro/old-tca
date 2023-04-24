//
//  LifecycleAction.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 19.04.2023.
//

import TCA
import Foundation

public enum LifecycleAction<Action: Equatable>: Equatable {
  case onAppear
  case onDisappear
  case wrapped(Action)
}
