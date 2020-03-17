//
//  ViewController.swift
//  Lab10 MKMap
//
//  Created by 游孟修 on 2020/3/15.
//  Copyright © 2020 游孟修. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView:MKMapView!
    static var location:CLLocationManager? = nil
    var pointArr = [[25.043775, 121.560642], [25.047945, 121.516941], [25.019982, 121.545314],
                    [25.058198, 121.542477], [25.026799, 121.522855], [25.043775, 121.560642]]
    override func viewDidLoad() {
        super.viewDidLoad()
        if ViewController.location == nil {
            ViewController.location = CLLocationManager()
            ViewController.location?.requestWhenInUseAuthorization()
            ViewController.location?.startUpdatingLocation()
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func showMyLocation(_ sender: Any) {
        if ViewController.location == nil {
            ViewController.location = CLLocationManager()
            ViewController.location?.requestWhenInUseAuthorization()
            ViewController.location?.startUpdatingLocation()
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            let center = mapView.userLocation.coordinate
            let region = MKCoordinateRegion(center: center, span: span)
            mapView.setRegion(region, animated: true)
        }
        else {
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            let center = mapView.userLocation.coordinate
            let region = MKCoordinateRegion(center: center, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    @IBAction func addAnnotation(_ sender: Any) {
        mapView.removeOverlays(mapView.overlays)
        let annotation = MKPointAnnotation()
        let latlng = CLLocationCoordinate2DMake(25.0510977, 121.5371945)
        annotation.coordinate = latlng
        annotation.title = "NaviPlus"
        annotation.subtitle = "台北市建國北路一段69號"
        mapView.addAnnotation(annotation)
        mapView.setCenter(annotation.coordinate, animated: true)
    }
    
    @IBAction func addPolyline(_ sender: Any) {
        mapView.removeAnnotations(mapView.annotations)
        var linePoints = [CLLocationCoordinate2D]()
        for point in pointArr {
            linePoints.append(CLLocationCoordinate2DMake(point[0], point[1]))
        }
        let line = MKPolyline(coordinates: linePoints, count:pointArr.count)
        mapView.addOverlay(line)
        mapView.setCenter(line.coordinate, animated: true)
    }
}

extension ViewController : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay.isKind(of: MKPolyline.self) {
            let  lineView = MKPolylineRenderer(polyline: overlay as! MKPolyline)
            lineView.strokeColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            lineView.lineWidth = 10
            return lineView as MKOverlayRenderer
        }
        return MKOverlayRenderer()
    }
}

