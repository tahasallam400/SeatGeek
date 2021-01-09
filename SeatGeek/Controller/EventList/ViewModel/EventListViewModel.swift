//
//  EventListViewModel.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/7/21.
//

import Foundation
public class EventListViewModel{
    
   public weak var eventList : GenericDataSource<Event>?
    private  var eventBeforeSearch: [Event] = []
   public init(eventList : GenericDataSource<Event>?) {
        self.eventList = eventList
   }
    

    func startSearch(){
        if eventList!.data.value.count != 0 {
            eventBeforeSearch = eventList?.data.value ?? []
            eventList?.data.value = []
        }
    }
    
    public func search(query:String){
            eventList?.data.value = (self.eventBeforeSearch.filter{
                
                return  ($0.title?.lowercased().contains(query.lowercased()) ?? false) || ($0.venue?.name?.lowercased().contains(query.lowercased()) ?? false)
            })
   }
    
    
   public func fetch(){
        DispatchQueue.global(qos: .userInteractive).sync { [weak self] in
        
            guard let self = self else {
            return
          }
            networkManager.Events(client_id: "MjE0ODA5MDN8MTYwOTk1NDk4NC42MzIwOTMy", client_secret: "4cbd20eddd607af3ac5989b624cac95fc5c50215c93afb505f8f44dd6760cd33", completion: {item,error in
                if let eventList = item?.events {
                    self.eventList?.data.value = eventList
                }
            })
            
        }
    }
}
