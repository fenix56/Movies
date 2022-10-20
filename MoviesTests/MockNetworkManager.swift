//
//  MockNetworkManager.swift
//  MoviesTests
//
//  Created by Przemek on 25/01/22.
//

import Foundation
@testable import Movies
import Combine



///
///
/// 1. add tabbar controller to show two tabs , tab1 will be Search , tab 2 will diapsy favourtite itesm.
/// 2. when you search any item in search tab , for each item have mark favrourite functuanlity
/// 3. when user make any iteam as favourtie it will be saved in core data and when user navigates to tab2  these favourties itesm will be shown.
///
///
///  1. create new branch to do changes
///  2. once done reaise PR , add all other teamamates.
///
///
///    Due Date : 03/21
///
///
class MockNetworkManager: Networkable {
    func doApiCall(apiRequest: ApiRequestType) -> Future<Data, ServiceError> {
        return Future { promise in
            
            let bundle = Bundle(for:MockNetworkManager.self)
            
            guard let url = bundle.url(forResource:apiRequest.path, withExtension:"json"),
                  let data = try? Data(contentsOf: url)

            else {
                promise(.failure(ServiceError.dataNotFound))
          
                return
            }
            promise(.success(data))
        }
    }
}
