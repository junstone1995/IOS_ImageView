//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Junseok Lee on 2021/09/03.
//

import UIKit

extension UIViewController{
    var contentViewController:UIViewController{
        if let navcon = self as? UINavigationController{
            return navcon.visibleViewController ?? self
        }else{
            return self
        }
    }
}

class CassiniViewController: UIViewController {

    private struct Storyboard{
        static let ShowImageSegue = "Show Image"
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.ShowImageSegue{
            if let ivc = (segue.destination.contentViewController as? ImageViewController){
                let imageName = (sender as? UIButton)?.currentTitle
                ivc.imageURL = DemoURL.NASAImageNamed(imageName: imageName)
                ivc.title = imageName
            }
        }
    }
    
    

}
