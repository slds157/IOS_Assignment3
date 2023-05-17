//
//  IssuedTicketsViewController.swift
//  Assignment3
//
//  Created by Zheng Yuan on 2023-05-17.
//

import UIKit

struct Ticket: Codable {
    let seatNumber: String
    let movieName: String
    let session: String
    let date: Date
}

class IssuedTicketsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var tickets: [Ticket] = [] // This will hold our ticket data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegate and data source for the TableView
        tableView.delegate = self
        tableView.dataSource = self
        
        // Load the tickets
        loadTickets()
    }
    
    func loadTickets() {
        // Load the tickets from UserDefaults
        if let data = UserDefaults.standard.value(forKey:"tickets") as? Data {
            tickets = try! PropertyListDecoder().decode(Array<Ticket>.self, from: data)
            tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IssuedTicketCell", for: indexPath)
        let ticket = tickets[indexPath.row]
        cell.textLabel?.text = ticket.movieName
        cell.detailTextLabel?.text = "Seat: \(ticket.seatNumber), Session: \(ticket.session), Date: \(ticket.date)"
        return cell
    }
    
    @IBAction func goHome(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
