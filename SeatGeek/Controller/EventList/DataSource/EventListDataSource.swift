//
//  EventListDataSource.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/7/21.
//


import Foundation
import UIKit
import Kingfisher
import Reachability


public class EventListDataSource:GenericDataSource<Event>,UITableViewDelegate,UITableViewDataSource{
    var showDetailsProtocol:ShowDetailsProtocol?
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch data.value.count {
        case 0:
            return 1
        default:
            return data.value.count
        }
    }
   
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < data.value.count{
            showDetailsProtocol?.showDetails(event: data.value[indexPath.row])
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch data.value.count {
        case 0:
            return tableView.frame.height
        default:
            return UITableView.automaticDimension
        }
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch data.value.count {
        case 0:
            if reachability.connection == .unavailable{
                return tableView.dequeueReusableCell(withIdentifier: "NoInternetAcess")!
            }else{
                return tableView.dequeueReusableCell(withIdentifier: "NoDataAvailable")!
            }
        default:
            let cell =  tableView.dequeueReusableCell(withIdentifier: "mainCell") as! mainCell
            cell.configureCell(event:data.value[indexPath.row])
            return cell
        }
    }
}
