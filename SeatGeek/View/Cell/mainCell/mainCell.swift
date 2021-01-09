//
//  mainCell.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/6/21.
//

import UIKit

class mainCell: UITableViewCell {
    
    @IBOutlet weak var date_: UILabel!
    
    @IBOutlet weak var name_: UILabel!
    @IBOutlet weak var time_: UILabel!
    @IBOutlet weak var location_: UILabel!
    @IBOutlet weak var image_: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        image_.makeRounded(15)
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(event:Event){
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
            time_.text = convertTime.string(from: date)
        }
            
    }
}
