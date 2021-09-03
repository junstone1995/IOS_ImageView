//
//  ImageViewController.swift
//  Cassini
//
//  Created by Junseok Lee on 2021/09/03.
//

import UIKit

class ImageViewController: UIViewController {

    var imageURL: NSURL?{
        didSet{
            image = nil
            fetchImage()
        }
    }
    
    private func fetchImage(){
        if let url = imageURL{
            if let imageData = NSData(contentsOf: url as URL){
                image = UIImage(data: imageData as Data)
            }
        }
    }
    private var imageView = UIImageView()
    
    private var image: UIImage?{
        get{
            return imageView.image
        }
        set{
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        // Do any additional setup after loading the view.
    }
    

}
