@objc(DatePickerModule)
class DatePickerModule: NSObject, RCTBridgeModule {

  static func moduleName() -> String! {
    return "DatePickerModule"
  }

  private var callback: RCTResponseSenderBlock?
  private var datePicker: UIDatePicker?
  private var toolbar: UIToolbar?

  @objc func showDatePicker(_ style: String, callback: @escaping RCTResponseSenderBlock) {
      DispatchQueue.main.async {
          let datePicker = UIDatePicker()
          datePicker.datePickerMode = .date
          switch style {
          case "wheels":
              datePicker.preferredDatePickerStyle = .wheels
          default:
              datePicker.preferredDatePickerStyle = .compact
          }
          print(time)
          datePicker.tintColor = .systemBlue // Set the tint color to system blue

          // Save the callback and date picker
          self.callback = callback
          self.datePicker = datePicker

          // Create "Confirm" button with a modern style
          let confirmButton = UIButton(type: .system)
          confirmButton.setTitle("Confirm", for: .normal)
          confirmButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
          confirmButton.setTitleColor(.systemBlue, for: .normal)
          confirmButton.addTarget(self, action: #selector(self.confirmSelectedDate), for: .touchUpInside)

          // Create "Cancel" button with a modern style
          let cancelButton = UIButton(type: .system)
          cancelButton.setTitle("Cancel", for: .normal)
          cancelButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
          cancelButton.setTitleColor(.systemBlue, for: .normal)
          cancelButton.addTarget(self, action: #selector(self.cancelDatePicker), for: .touchUpInside)

          // Create toolbar to hold the buttons
          let toolbar = UIToolbar()
          toolbar.barStyle = .default
          toolbar.isTranslucent = true
          toolbar.setItems([UIBarButtonItem(customView: cancelButton), UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), UIBarButtonItem(customView: confirmButton)], animated: false)
          toolbar.sizeToFit()

          self.toolbar = toolbar // Save toolbar reference

          // Obtain the root view controller
          guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else {
              // Handle error: unable to get root view controller
              return
          }

          // Add the date picker and toolbar to the root view controller's view
          rootViewController.view.addSubview(datePicker)
          rootViewController.view.addSubview(toolbar)

          // Position the toolbar at the bottom of the screen
          toolbar.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
              toolbar.leadingAnchor.constraint(equalTo: rootViewController.view.leadingAnchor),
              toolbar.trailingAnchor.constraint(equalTo: rootViewController.view.trailingAnchor),
              toolbar.bottomAnchor.constraint(equalTo: rootViewController.view.bottomAnchor),
              toolbar.heightAnchor.constraint(equalToConstant: 44) // Set toolbar height
          ])

          // Position the date picker above the toolbar
          datePicker.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
              datePicker.leadingAnchor.constraint(equalTo: rootViewController.view.leadingAnchor),
              datePicker.trailingAnchor.constraint(equalTo: rootViewController.view.trailingAnchor),
              datePicker.bottomAnchor.constraint(equalTo: toolbar.topAnchor)
          ])
      }
  }

//  @objc func confirmSelectedDate() {
//      // Implementation for confirming the selected date
//  }
//
  @objc func cancelDatePicker() {
    if let datePicker = self.datePicker {

      datePicker.removeFromSuperview()
      if let toolbar = self.toolbar {
        toolbar.removeFromSuperview()
      }
    }
  }


  @objc func confirmSelectedDate() {
    if let datePicker = self.datePicker {
      let selectedDate = datePicker.date
      let formatter = ISO8601DateFormatter()
      let dateString = formatter.string(from: selectedDate)

      // Call the callback with the selected date
      if let callback = callback {
        callback([dateString])
      }

      // Remove the date picker and toolbar from the view
      datePicker.removeFromSuperview()
      if let toolbar = self.toolbar {
        toolbar.removeFromSuperview()
      }
    }
  }
}
