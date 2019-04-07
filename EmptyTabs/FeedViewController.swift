//
//  FeedViewController.swift
//  EmptyTabs
//
//  Created by Manu Singh on 07/04/19.
//  Copyright © 2019 Manu Singh. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let details = EmptyTabData(title: "Feed tab is empty", image: "retry", description: "Add something here")
        showEmptyTabView(details: details)
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

extension FeedViewController : EmptyTabDelegate {
    func emptyTabRetryClicked(_ sender: EmptyTabViewController) {
        //do something
        let alert = UIAlertController(title: "Clicked", message: "you clicked on retry button", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
