//
//  SeatSelectionViewController.swift
//  Assignment3
//
//  Created by Tony on 16/5/2023.
//

import UIKit

class SeatSelectionViewController: UIViewController {
    private var seats: [[Seat]] = Array(repeating: Array(repeating: Seat(row: 0, column: 0, status: .available), count: 10), count: 6)
    private var seatButtons: [[SeatButton]] = []
    private let seatButtonSize: CGSize = CGSize(width: 40, height: 40)
    private let seatButtonSpacing: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeSeats()
        setupSeatButtons()
    }
    
    private func initializeSeats() {
        for row in 0..<seats.count {
            for column in 0..<seats[row].count {
                seats[row][column] = Seat(row: row, column: column, status: .available)
            }
        }
    }
    
    private func setupSeatButtons() {
        let numberOfRows = seats.count
        let numberOfColumns = seats.first?.count ?? 0
        let totalWidth = CGFloat(numberOfColumns) * (seatButtonSize.width + seatButtonSpacing) - seatButtonSpacing
        let totalHeight = CGFloat(numberOfRows) * (seatButtonSize.height + seatButtonSpacing) - seatButtonSpacing
        let startX = (view.bounds.width - totalWidth) / 2
        let startY = (view.bounds.height - totalHeight) / 2
        
        for row in 0..<numberOfRows {
            var buttonRow: [SeatButton] = []
            for column in 0..<numberOfColumns {
                let seatButton = SeatButton(type: .custom)
                seatButton.configure(seat: seats[row][column])
                let x = startX + CGFloat(column) * (seatButtonSize.width + seatButtonSpacing)
                let y = startY + CGFloat(row) * (seatButtonSize.height + seatButtonSpacing)
                seatButton.frame = CGRect(x: x, y: y, width: seatButtonSize.width, height: seatButtonSize.height)
                view.addSubview(seatButton)
                buttonRow.append(seatButton)
            }
            seatButtons.append(buttonRow)
        }
    }
}
