/*
* Copyright (c) 2014 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit
import MapKit

class ViewController: UIViewController {
  
  @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var weatherImage: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Configure Image Size Classes
    let scale1x = UITraitCollection(displayScale: 1.0)
    let scale2x = UITraitCollection(displayScale: 2.0)
    let scale3x = UITraitCollection(displayScale: 3.0)
    let compactHeight = UITraitCollection(verticalSizeClass: .Compact)
    
    let image = UIImage(named: "cloud_big.png")
    image?.imageAsset?.registerImage(UIImage(named: "cloud_big_2x.png")!, withTraitCollection: scale2x)
    image?.imageAsset?.registerImage(UIImage(named: "cloud_big_3x.png")!, withTraitCollection: scale3x)
    image?.imageAsset?.registerImage(
        UIImage(named: "cloud_small.png")!,
        withTraitCollection: UITraitCollection(traitsFromCollections: [scale1x, compactHeight]))
    image?.imageAsset?.registerImage(
        UIImage(named: "cloud_small_2x.png")!,
        withTraitCollection: UITraitCollection(traitsFromCollections: [scale2x, compactHeight]))
    image?.imageAsset?.registerImage(
        UIImage(named: "cloud_small_3x.png")!,
        withTraitCollection: UITraitCollection(traitsFromCollections: [scale3x, compactHeight]))
    
    // Configure the map to show the correct location
    let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.498333, longitude: 138.685278),
      span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    mapView.setRegion(region, animated: true)
    mapView.scrollEnabled = false
    mapView.zoomEnabled = false
    mapView.rotateEnabled = false
    mapView.pitchEnabled = false
    mapView.mapType = .Hybrid
  }
}

