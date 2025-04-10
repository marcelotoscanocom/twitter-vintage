//
//  LoginViewController.swift
//  twitter-vintage
//
//  Created by cron on 2/11/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    let logoImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "TwitterLogo"))
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let emailImageView: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: String(stringLiteral: "mail"))
        im.setDimensions(width: 24, height: 24)
        im.tintColor = .white
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    
    let emailTextView: UITextField = {
        let tv = UITextField()
        tv.attributedPlaceholder = NSAttributedString(string: "User Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        tv.textColor = .white
        tv.font = UIFont.systemFont(ofSize: 14)
        tv.textColor = .white
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return tv
    }()
    
    let emailDivider: UIView = {
        let dv = UIView()
        dv.backgroundColor = .white
        dv.tintColor = .white
        dv.translatesAutoresizingMaskIntoConstraints = false
        dv.heightAnchor.constraint(equalToConstant: 0.65).isActive = true
        return dv
    }()
    
    let passwordImageView: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: String(stringLiteral: "lock"))
        im.setDimensions(width: 24, height: 24)
        im.tintColor = .white
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    
    let passwordTextView: UITextField = {
        let tv = UITextField()
        tv.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        tv.textColor = .white
        tv.font = UIFont.systemFont(ofSize: 14)
        tv.textColor = .white
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return tv
    }()
    
    let passwordDivider: UIView = {
        let dv = UIView()
        dv.backgroundColor = .white
        dv.tintColor = .white
        dv.translatesAutoresizingMaskIntoConstraints = false
        dv.heightAnchor.constraint(equalToConstant: 0.65).isActive = true
        return dv
    }()

    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(doLogin), for: .touchUpInside)
        return button
    }()
    
    let newAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Don't have an account? Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        view.addTapAction(target: self, action: #selector(viewTapped))
//        if let _ = UserDefaults.standard.dictionary(forKey: "usuario") as? [String: String] {
//            goHome()
//            print("usuario encontrado")
//            return
//        }
    }
    
    @objc func handleShowSignUp() {
        let controller = RegistrationViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func configureUI() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .default
        view.addSubview(logoImageView)
        
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 150, height: 150)
        
        logoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        view.addSubview(emailImageView)
        view.addSubview(emailTextView)
        view.addSubview(emailDivider)
        
        view.addSubview(passwordImageView)
        view.addSubview(passwordTextView)
        view.addSubview(passwordDivider)
        
        view.addSubview(loginButton)
        view.addSubview(newAccountButton)
        
        logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        emailImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20).isActive = true
        emailImageView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        
        emailTextView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20).isActive = true
        emailTextView.leftAnchor.constraint(equalTo: emailImageView.rightAnchor, constant: 8).isActive = true
        emailTextView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
        emailDivider.topAnchor.constraint(equalTo: emailImageView.bottomAnchor, constant: 10).isActive = true
        emailDivider.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        emailDivider.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
        passwordImageView.topAnchor.constraint(equalTo: emailDivider.bottomAnchor, constant: 30).isActive = true
        passwordImageView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        
        passwordTextView.topAnchor.constraint(equalTo: emailDivider.bottomAnchor, constant: 30).isActive = true
        passwordTextView.leftAnchor.constraint(equalTo: passwordImageView.rightAnchor, constant: 8).isActive = true
        passwordTextView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
        passwordDivider.topAnchor.constraint(equalTo: passwordImageView.bottomAnchor, constant: 10).isActive = true
        passwordDivider.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        passwordDivider.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: passwordDivider.bottomAnchor, constant: 100).isActive = true
        loginButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
        newAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        newAccountButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16).isActive = true
        newAccountButton.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -16).isActive = true
        newAccountButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    @objc func viewTapped() {
        print("View foi clicada!")
        view.dismissKeyboardIfActive()
    }
    
    @objc func doLogin() {
        
        guard let email = emailTextView.text, !email.isEmpty,
              let senha = passwordTextView.text, !senha.isEmpty else {
            showAlert(titulo: "Erro", mensagem: "Preencha todos os campos.")
            return
        }

        if let usuarioSalvo = UserDefaults.standard.dictionary(forKey: "usuario") as? [String: String] {
            let emailSalvo = usuarioSalvo["email"] ?? "erroemail"
            let senhaSalva = usuarioSalvo["password"] ?? "errosenha"
            
            if email == emailSalvo && senha == senhaSalva {
                print("email \(email) email salvo \(emailSalvo) , senha \(senha) senha salva \(senhaSalva)")
                goHome()
            }
            else {
                print(usuarioSalvo)
                print("email \(email) email salvo \(emailSalvo) , senha \(senha) senha salva \(senhaSalva)")
                showAlert(titulo: "Erro de Login", mensagem: "Email ou senha incorretos.")
            }
                
        } else {
                showAlert(titulo: "Nenhum usuário", mensagem: "Cadastre-se primeiro.")
        }
        
        print("Login realizado com sucesso!")
    }
    
    private func showAlert(titulo: String, mensagem: String) {
            let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
    }
    
    @objc func goHome() {
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
    }

}
