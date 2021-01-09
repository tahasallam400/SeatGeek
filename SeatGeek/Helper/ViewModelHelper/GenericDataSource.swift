//
//  GenericDataSource.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/7/21.
//

import Foundation
public class GenericDataSource<T> : NSObject {
  public  var data: DynamicValue<[T]> = DynamicValue([])
}
