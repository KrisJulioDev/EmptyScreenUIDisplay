//
//  ViewController.swift
//  EmptyScreenDisplay
//
//  Created by Khristoffer Julio on 1/12/24.
//

import UIKit

struct ViewItem {
    let title: String
    let image: UIImage
    var subtitle: String?
}

class ViewController: UIViewController {
    private var items: [ViewItem] {
        let item1 = ViewItem(title: "No data found!",
                             image: UIImage(systemName: "icloud.slash.fill")!,
                             subtitle: "Files you downloaded will appear here")
        
        let item2 = ViewItem(title: "No matches found!",
                             image: UIImage(systemName: "person.crop.circle.fill.badge.xmark")!,
                             subtitle: "Try updating your profile to find matches.")
        
        return [item1, item2]
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.register(SelectionCell.self, forCellReuseIdentifier: String(describing: SelectionCell.self))
        return tableView
    }()
    
    private lazy var dataSource: UITableViewDiffableDataSource<Int, CellController> = {
        let datasource = UITableViewDiffableDataSource<Int, CellController>(tableView: tableView) { _, _, itemIdentifier in
            return itemIdentifier
        }
        
        return datasource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Empty Screen Display"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "trash")?
                            .withRenderingMode(.alwaysTemplate)
                            .withTintColor(.black),
            style: .plain,
            target: self,
            action: #selector(clearDataList)
        )
        
        setTableSources()
        setTableData()
    }
    
    @objc private func clearDataList() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, CellController>()
        snapshot.deleteAllItems()
        dataSource.apply(snapshot)
    }
    
    private func setTableSources() {
        view = tableView
        tableView.dataSource = dataSource
    }
    private func setTableData() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, CellController>()
        snapshot.appendSections([0])
        snapshot.appendItems(items.map { CellController.create($0) })
        dataSource.apply(snapshot)
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(BasicViewController(item: item), animated: true)
        case 1:
            navigationController?.pushViewController(InformativeViewController(item: item), animated: true)
        default: break
        }
        
    }
}

#Preview {
    ViewController()
}

