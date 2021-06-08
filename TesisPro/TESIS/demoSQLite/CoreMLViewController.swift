//
//  CoreMLViewController.swift
//  demoSQLite
//
//  Created by EDITOR  on 10/02/21.
//  Copyright © 2021 haris. All rights reserved.
//

import UIKit
import Vision
import CoreML
import AVKit
class CoreMLViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //Variables.
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var ClasificacionLb: UILabel!
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image =  info[.originalImage] as? UIImage{
            img.image =  image
            classifyImage(image)
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func camaraTap(_ sender: Any) {
        let pickerController =  UIImagePickerController()
        pickerController.delegate =  self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion:  nil )
    }
    
    lazy var clasificationRequest : VNCoreMLRequest = {
         do{
             let model  = try VNCoreMLModel(for:Inceptionv3(configuration:.init()).model)
             let request =  VNCoreMLRequest(model: model) { request, _ in
                 if let clasificacion =  request.results  as? [VNClassificationObservation]{
                    //No. de Clases (4).
                     let TopClasificacion = clasificacion.prefix(4)
                     let descripcion =  TopClasificacion.map{
                         clasificacion in
                         return String(format: "%. 1f%% %@", clasificacion.confidence * 100, clasificacion.identifier )
                     }
                     DispatchQueue.main.async {
                         self.ClasificacionLb.text = "Clasificación:" + descripcion.joined(separator: "\n")
                     }
                 }
             }
             request.imageCropAndScaleOption =  .centerCrop
             return request
             
         } catch{
             fatalError()
         }
         
     }()
    
    func classifyImage(_ image: UIImage){
        guard let orientation = CGImagePropertyOrientation(rawValue: UInt32(image.imageOrientation.rawValue)) else { return  }
        guard let ciImage = CIImage(image: image) else { fatalError("Unable to create \(CIImage.self) from \(image).") }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation)
            do {
                try handler.perform([self.clasificationRequest])
            } catch {
               
                print("Error al clasificarla.\n\(error.localizedDescription)")
            }
        }
    }    
}
