//
//  ViewController.swift
//  SampleAppWithOnDemandResources
//
//  Created by Romain Pouclet on 2017-11-28.
//  Copyright © 2017 Buddybuild. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var container: UIImageView!
    private let request = NSBundleResourceRequest(tags: ["large-galaxy"])

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Image has on-demand tags, so it's nil
        let image = UIImage(named: "galaxy")
        guard image == nil else {
            fatalError("Image shouldn't be embedded in the app!")
        }

        request.beginAccessingResources { [weak self] error in
            if let _ = error {
                fatalError("Unable to start a bundle resource request")
            }


            guard let galaxyImage = UIImage(named: "galaxy") else {
                fatalError("Galaxy image should be available!")
            }

            DispatchQueue.main.async {
                self?.container.image = galaxyImage
            }
        }
    }

}

