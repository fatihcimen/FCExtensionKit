//
//  FakeCellClasses.swift
//  FCExtensionKitTests
//
//  Created by Erinç Olkan Dokumacıoğlu on 22.04.2022.
//

import UIKit
import FCExtensionKit

class FakeCollectionViewCell: UICollectionViewCell {
    
}

class FakeTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle = .default, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
