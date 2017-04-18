//
//  ViewController.swift
//  PokeFinder
//
//  Created by christian Picondo on 18/04/2017.
//  Copyright © 2017 cpicondo. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func spotRandomPokemon(_ sender: UIButton) {
    }

}

