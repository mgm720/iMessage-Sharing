//
//  ViewController.swift
//  iMessage Sharing
//
//  Created by Michael Miles on 5/21/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController {
    
    @IBOutlet weak var dogImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch (result) {
        case .cancelled:
            print("Message was cancelled")
            dismiss(animated: true, completion: nil)
        case .failed:
            print("Message failed")
            dismiss(animated: true, completion: nil)
        case .sent:
            print("Message Sent!")
            dismiss(animated: true, completion: nil)
        default:
            break
        }
    }
    
    
    @IBAction func sendMessage(_ sender: Any) {
        if MFMessageComposeViewController.canSendText() {
            let messageVC = MFMessageComposeViewController()
            
            messageVC.body = "Check out this picture I found on this awesome app!"
            messageVC.recipients = ["Enter Recipients Here"]
            if let imageData = dogImageView.image?.pngData() {
                messageVC.addAttachmentData(imageData, typeIdentifier: "public.data", filename: "mav_stick.png")
            }
            messageVC.messageComposeDelegate = self
            
            self.present(messageVC, animated: true, completion: nil)
        } else {
            print("Message couldn't be sent")
        }
        
    }
}

