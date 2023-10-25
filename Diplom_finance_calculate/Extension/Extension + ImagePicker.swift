//
//  Extension + ImagePicker.swift
//  Diplom_finance_calculate
//
//  Created by Sergei Otoka on 11.10.23.
//

import UIKit

class ImagePicker: UIViewController {

    var onSelectImage: ((UIImage) -> Void)?

    private lazy var descLabel: UILabel = {
        let dl = UILabel()
        dl.text = "For change avatar choose image in gallery or take photo".locolizable()
        dl.textColor = .myTextColor
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.numberOfLines = 0

        return dl
    }()

    private lazy var openGallery: UIButton = {
        let og = UIButton()
        og.backgroundColor = .myButtonAndOtherColor
        og.tintColor = .myTextColor
        og.setTitle("Galery".locolizable(), for: .normal)
        og.translatesAutoresizingMaskIntoConstraints = false
        og.layer.cornerRadius = 10
        og.addTarget(self, action:  #selector(gallery), for: .touchUpInside)

        return og
    }()

    private lazy var openCamera: UIButton = {
        let oc = UIButton()
        oc.backgroundColor = .myButtonAndOtherColor
        oc.tintColor = .myTextColor
        oc.setTitle("Camera".locolizable(), for: .normal)
        oc.translatesAutoresizingMaskIntoConstraints = false
        oc.layer.cornerRadius = 10
        oc.addTarget(self, action: #selector(camera), for: .touchUpInside)

        return oc
    }()

    private lazy var cancel: UIButton = {
        let cancel = UIButton()
        cancel.backgroundColor = .systemRed
        cancel.tintColor = .myTextColor
        cancel.setTitle("Cancel".locolizable(), for: .normal)
        cancel.translatesAutoresizingMaskIntoConstraints = false
        cancel.layer.cornerRadius = 10
        cancel.addTarget(self, action: #selector(cancelPicker), for: .touchUpInside)

        return cancel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .myBackgroundColor
        view.layer.cornerRadius = 10
        view.addSubview(descLabel)
        view.addSubview(openGallery)
        view.addSubview(openCamera)
        view.addSubview(cancel)

        descLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.top.equalToSuperview()
            $0.height.equalTo(50)
        }

        openGallery.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.top.equalTo(descLabel.snp.bottom).inset(-15)
        }

        openCamera.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.top.equalTo(openGallery.snp.bottom).inset(-15)
        }

        cancel.snp.makeConstraints {
            $0.top.equalTo(openCamera.snp.bottom).inset(-15)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(50)
        }
    }

    @objc private func gallery() {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = true
        pickerController.delegate = self
        present(pickerController, animated: true)
    }

    @objc func camera() {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .camera
        pickerController.allowsEditing = true
        pickerController.delegate = self
        present(pickerController, animated: true)
    }

    @objc func cancelPicker() {
        dismiss(animated: true)
    }

    func save(image: UIImage) {
        let userDefaultsManager = UserDefaultsManager()
        let imageData = image.pngData()!
        userDefaultsManager.set(imageData, forKey: .homeImage)
    }
}

extension ImagePicker: UIImagePickerControllerDelegate,
                       UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        if let image = info[.editedImage] as? UIImage {
            onSelectImage?(image)
            save(image: image)
        }
        picker.dismiss(animated: true)
        self.dismiss(animated: true)
    }
}
