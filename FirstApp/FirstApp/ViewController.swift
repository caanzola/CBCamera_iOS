//
//  ViewController.swift
//  FirstApp
//
//  Created by Camilo on 1/28/19.
//  Copyright © 2019 Camilo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    var imagePass = UIImage()
    
    @IBOutlet weak var selectedImage: UIImageView!
    let imagePicker = UIImagePickerController()
    
    @IBAction func openCamera(_ sender: Any)
    {
        imagePicker.delegate = self
         if(UIImagePickerController.isSourceTypeAvailable(.camera))
        {
            if(UIImagePickerController.availableCaptureModes(for: .rear) != nil)
            {
                
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .camera
                imagePicker.cameraCaptureMode = .photo
                
                self.present(imagePicker, animated:true, completion:nil)
            }
        }
        
    }
    
    @IBAction func openFileExplorer(_ sender: Any)
    {
       imagePicker.delegate = self
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary))
        {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
           self.present(imagePicker, animated:true, completion:nil)
        }
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.originalImage] as? UIImage else {
            print("No image found")
            return
        }
        
        // print out the image size as a test
        //myImage.image = image
        
        imagePass = image
        selectedImage.image = image
        
        
        
        //let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewControllerID") as!SecondViewController
        
        
        //vc.takenImage = imagePass
        
        //self.present(vc, animated:true, completion:nil)
        
        
        
    }
    
    
    @IBAction func aplicarFiltro(_ sender: Any)
    {
        
        let actionSheet = UIAlertController(title: "Seleccione el tipo de filtro que desea", message: "¿Para daltónico rojo, verde o azul?", preferredStyle: .actionSheet)
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let rojo = UIAlertAction(title: "Daltónico rojo", style: .default){ action in
            
            self.selectedImage.image = self.imagePass
            let beginImage = CIImage(image:self.selectedImage!.image!)
            if let filter = CIFilter(name:"CIColorCrossPolynomial")
            {
                filter.setValue(beginImage, forKey:kCIInputImageKey)
                let newImage = UIImage(ciImage: filter.outputImage!)
                self.selectedImage!.image = newImage
            }
        }
        let verde = UIAlertAction(title: "Daltónico verde", style: .default){ action in
            
            self.selectedImage.image = self.imagePass
            let beginImage = CIImage(image:self.selectedImage!.image!)
            if let filter = CIFilter(name:"CIPhotoEffectTransfer")
            {
                filter.setValue(beginImage, forKey:kCIInputImageKey)
                let newImage = UIImage(ciImage: filter.outputImage!)
                self.selectedImage!.image = newImage
            }
        }
        let azul = UIAlertAction(title: "Daltónico azul", style: .default){ action in
            
            self.selectedImage.image = self.imagePass
            let beginImage = CIImage(image:self.selectedImage!.image!)
            if let filter = CIFilter(name:"CIColorMonochrome")
            {
                filter.setValue(beginImage, forKey:kCIInputImageKey)
                let newImage = UIImage(ciImage: filter.outputImage!)
                self.selectedImage!.image = newImage
            }
        }
        
        actionSheet.addAction(azul)
        actionSheet.addAction(verde)
        actionSheet.addAction(rojo)
        actionSheet.addAction(cancelar)
        
        present(actionSheet, animated: true, completion: nil)
        
        // NO BORRAR ESTO HACE EL FILTRO
        
        //let beginImage = CIImage(image:selectedImage!.image!)
        //if let filter = CIFilter(name:"CIColorInvert")
        //{
          //  filter.setValue(beginImage, forKey:kCIInputImageKey)
            //let newImage = UIImage(ciImage: filter.outputImage!)
            //selectedImage!.image = newImage
        //}
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }


}


