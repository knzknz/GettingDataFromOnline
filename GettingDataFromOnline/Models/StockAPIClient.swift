//
//  StockAPIClient.swift
//  GettingDataFromOnline
//
//  Created by C4Q  on 11/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class StockAPIClient {
    //Below we are setting up the things that are required win the perform data task
    //This is a singleton because we only want one APIClient.
    private init() {}
    static let manager = StockAPIClient()
    func getStock(from urlStr: String,
                  completionHandler: @escaping (Stock) -> Void, // what should we do with a Stock
                  errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return} //getting your url first
        //The below is a closure that will go into the network helper
        //Defines a closure that converts data to stock
        let completion: (Data) -> Void = {(data: Data) in
            do {
                //The below is telling the network helper what to do when it gets data
                let stock = try JSONDecoder().decode(Stock.self, from: data)
                completionHandler(stock)
            }
            catch let error {
                errorHandler(error)
            }
        }
        
        //In this part, it actually talks to internet
        NetworkHelper.manager.performDataTask(with: url,
                                              completionHandler: completion, //here is what should we do with data?
                                              errorHandler: errorHandler)
    }
}
