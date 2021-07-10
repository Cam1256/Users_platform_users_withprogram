class Estudiante < ApplicationRecord
    has_secure_password

    validates :nombre, presence: true
    validates :apellido, presence: true
    validates :identificacion, presence: true 
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "dirección de correo no válida" }
    validates :password_digest, presence: true
    validates :programa, presence: true


    

end
