//
//  ViewController.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/6/21.
//

import UIKit
import Reachability
class EventListViewController: UIViewController {
    
    
    var refreshControl = UIRefreshControl()
    
    
    
    var searchController: UISearchController!
    @IBOutlet weak var tableview: UITableView!
    let eventListDataSource = EventListDataSource()
    
    lazy var eventListViewModel:EventListViewModel = {
        return  EventListViewModel(eventList: eventListDataSource)
    }()
   
    
    
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        configureUI()
        initSearchBarController()
        
    }
    
    

   
    
    @objc func refresh(sender:AnyObject) {
        refreshControl.endRefreshing()
        eventListViewModel.fetch()
    }
    
    private func initSearchBarController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchResultsUpdater = self
        searchController?.delegate = self
        searchController.searchBar.delegate = self

        if #available(iOS 9.1, *) {
            searchController?.obscuresBackgroundDuringPresentation = false
        } else {
            // Fallback on earlier versions
        }

        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        } else {
            searchController?.dimsBackgroundDuringPresentation = false
            searchController?.hidesNavigationBarDuringPresentation = false
            searchController?.definesPresentationContext = true

            //                searchController?.searchBar.sizeToFit()
            tableview.tableHeaderView = searchController?.searchBar
        }
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false

                    performTaskAfterDealy(1, {
                        self.navigationItem.hidesSearchBarWhenScrolling = true
                    })
    }
    
    func performTaskAfterDealy(_ timeInteval: TimeInterval, _ task:@escaping () -> ()) {
            DispatchQueue.main.asyncAfter(deadline: (.now() + timeInteval)) {
                task()
            }
        }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func configureUI(){
        tableview.register(UINib.init(nibName: "mainCell", bundle: nil), forCellReuseIdentifier: "mainCell")
        
     
        tableview.register(UINib.init(nibName: "NoDataAvailable", bundle: nil), forCellReuseIdentifier: "NoDataAvailable")
        
        tableview.register(UINib.init(nibName: "NoInternetAcess", bundle: nil), forCellReuseIdentifier: "NoInternetAcess")
        
        
        self.tableview.rowHeight = UITableView.automaticDimension;
        self.tableview.estimatedRowHeight = 44.0;
        
        tableview.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
    }
    
    func configureViewModel(){
        tableview.dataSource = self.eventListDataSource
        tableview.delegate = self.eventListDataSource
       
        eventListDataSource.showDetailsProtocol = self
        self.eventListViewModel.fetch()
        
        self.eventListDataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.tableview.reloadData()
        }
        
        reachability.whenReachable = { reachability in
            self.eventListViewModel.fetch()
        }
    }
}


extension EventListViewController:ShowDetailsProtocol{
    func showDetails(event: Event) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EventDetailsViewController") as! EventDetailsViewController
        vc.event = event
         navigationController?.pushViewController(vc,
         animated: true)
        
    }
    
    
}

extension EventListViewController: UISearchResultsUpdating, UISearchControllerDelegate,UISearchBarDelegate{
    
    func updateSearchResults(for searchController: UISearchController) {
        
        eventListViewModel.startSearch()
        
        if let query = searchController.searchBar.text{
            eventListViewModel.search(query: query)
            
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    
        eventListViewModel.fetch()
    }
    
}


