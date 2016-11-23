//
//  MapViewController.swift
//  MapasApp
//
//  Created by Carlos Alberto Savi on 31/10/16.
//  Copyright © 2016 Carlos Alberto Savi. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    // MARK: Propriedades
    let meuEndereco = "Rua Inhambú, 864 - Apto 143 - Vila Uberabinha - São Paulo/SP - CEP 04520-013"
    
    // MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Converter o endereço em coordenadas
        let geoCode = CLGeocoder()
        geoCode.geocodeAddressString(meuEndereco, completionHandler: {
            
            placemarks, error in
            
            if error != nil {
                print(error!)
                return
            }
            
            // Temos a localização
            if let placemarks = placemarks {
                
                // Recupera a 1ª localização
                let placemark = placemarks[0]
                
                // Adicionar uma anotação
                let annotation = MKPointAnnotation()
                
                if let location = placemark.location {
                    
                    // Coordenada da anotação
                    annotation.coordinate = location.coordinate
                    
                    // Título para anotação
                    annotation.title = "Minha casa"
                    
                    // Adicionar a anotação no mapa
                    self.mapView.addAnnotation(annotation)
                    
                    // Exibe e seleciona a anotação
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                    
                }
            }
            
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
