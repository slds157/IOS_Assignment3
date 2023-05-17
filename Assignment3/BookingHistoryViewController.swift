//
//  BookingHistoryViewController.swift
//  Assignment3
//
//  Created by Zheng Yuan on 2023-05-17.
//

import UIKit

struct Booking: Codable {
    let movieName: String
    let userName: String
}

class BookingHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var bookings: [Booking] = [] // This will hold our booking data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegate and data source for the TableView
        tableView.delegate = self
        tableView.dataSource = self
        
        // Load the bookings
        loadBookings()
    }
    
    func loadBookings() {
        // Load the bookings from UserDefaults
        if let data = UserDefaults.standard.value(forKey:"bookings") as? Data {
            bookings = try! PropertyListDecoder().decode(Array<Booking>.self, from: data)
            tableView.reloadData()
        }
    }

    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookingHistoryCell", for: indexPath)
        let booking = bookings[indexPath.row]
        cell.textLabel?.text = booking.movieName
        cell.detailTextLabel?.text = booking.userName
        return cell
    }
    
    
    @IBAction func goHome(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}

