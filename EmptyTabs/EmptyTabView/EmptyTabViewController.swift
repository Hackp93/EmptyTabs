//
//  EmptyTabViewController.swift
//  EmptyTabs
//
//  Created by Manu Singh on 07/04/19.
//  Copyright © 2019 Manu Singh. All rights reserved.
//

import UIKit

class EmptyTabViewController: UIViewController {

    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var descriptionLabel : UILabel!
    
    var emptyTabData : EmptyTabData?
    
    weak var delegate : EmptyTabDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabDetails()
        // Do any additional setup after loading the view.
    }
    
    func setTabDetails(){
        titleLabel.text = emptyTabData?.title
        imageView.image = UIImage(named: emptyTabData?.image ?? "")
        descriptionLabel.text = emptyTabData?.emptyDescription
    }
    
    @IBAction func onClickRetry(_ sender : UIButton){
        delegate?.emptyTabRetryClicked(self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

struct EmptyTabData {
    var title : String?
    var image : String?
    var emptyDescription : String?
    
    init(title: String,image:String,description:String){
        self.title = title
        self.image = image
        self.emptyDescription = description
    }
    
}

protocol EmptyTabDelegate : NSObjectProtocol {
    func emptyTabRetryClicked(_ sender : EmptyTabViewController)
}

extension EmptyTabDelegate where Self : UIViewController {
    func showEmptyTabView(details : EmptyTabData){
        let controller = getEmptyTabController()
        controller.delegate = self
        controller.emptyTabData = details
        addEmptyTabController(controller)
        addConstraints(controller)
    }
    
    func getEmptyTabController()->EmptyTabViewController{
        let storyboard = UIStoryboard(name: "EmptyTab", bundle: nil)
        let emptyController = storyboard.instantiateInitialViewController() as? EmptyTabViewController
        return emptyController!
        
    }
    
    func addEmptyTabController(_ controller : UIViewController){
        addChild(controller)
        view.addSubview(controller.view!)
        controller.didMove(toParent: self)
        
    }
    
    func addConstraints(_ controller : UIViewController){
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: controller.view!, attribute: .leading, relatedBy: .equal, toItem: self.view!, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: controller.view!, attribute: .trailing, relatedBy: .equal, toItem: self.view!, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: controller.view!, attribute: .top, relatedBy: .equal, toItem: self.view!, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: controller.view!, attribute: .bottom, relatedBy: .equal, toItem: self.view!, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    }
    
    func removeEmptyTabView(){
        let controller = getChildEmptyTabController()
        controller?.willMove(toParent: nil)
        controller?.view.removeFromSuperview()
        controller?.removeFromParent()
    }
    
    func getChildEmptyTabController()->EmptyTabViewController?{
        for child in children {
            if let emptyController = child as? EmptyTabViewController {
                return emptyController
            }
        }
        return nil
    }
    
}
