//
//  Counter.swift
//  datepicker
//
//  Created by Nithin K R on 07/06/24.
//

import Foundation

@objc(Counter)
class Counter: NSObject{
  private var count = 0;
  @objc
  func increment(){
    count += 1;
    print(count)
  }
}
