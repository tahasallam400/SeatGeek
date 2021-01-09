//
//  EventDetailsViewController.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/7/21.
//

import UIKit

class EventDetailsViewController: UIViewController {
    @IBOutlet weak var hour_: UILabel!
    
    @IBOutlet weak var name_: UILabel!
    @IBOutlet weak var date_: UILabel!
    @IBOutlet weak var location_: UILabel!
    @IBOutlet weak var image_: UIImageView!
    var event: Event!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showDetails()
        configureUI()
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    func configureUI(){
        image_.makeRounded(15)
        navigationController?.title = "good thing"
        navigationController?.navigationBar.isHidden = true 
    }
    func showDetails(){
        name_.text = event.title
        
       
        if let imageURL =  event.performers?.first?.image, let url = URL(string: imageURL){
            
         
            image_.kf.setImage(with: url)
           
        }
        
        location_.text = event.venue?.name
        
        if let createdDate =  event.datetimeUTC{
            
            //dayNameOfWeek
            
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            let date = dateFormatter.date(from:createdDate)!
            let convertDateFormatter = DateFormatter()
                convertDateFormatter.dateFormat =  "dd MMM yyyy"

            let convertTime = DateFormatter()
            convertTime.dateFormat = "h:mm a"
            
            
            date_.text =  (date.dayNameOfWeek() ?? " ") + " " + convertDateFormatter.string(from: date)
            
            hour_.text = convertTime.string(from: date)
            
            
        }
    }
}
