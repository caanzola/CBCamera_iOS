//
//  SecondViewController.swift
//  FirstApp
//
//  Created by Camilo on 2/6/19.
//  Copyright © 2019 Camilo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    var takenImage : UIImage!
    var myString = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Se esta poniendo la imagen")
        print(takenImage.size)
        print(myString)
        print(takenImage)
        label.text = myString
        //myImage.image = takenImage
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
