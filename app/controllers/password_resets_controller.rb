class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @estudiante = Estudiante.find_by(email: params[:email])
        if @estudiante.present?
            PasswordMailer.with(estudiante: @estudiante).reset.deliver_now
            
        end
        redirect_to root_path, notice: "Si la cuenta de usuario fué encontrada, te enviaremos un link para restablecer tu contraseña"

        
    end

    def edit
        @estudiante = Estudiante.find_signed(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path, alert: "Your token has expired. Please try again"
    end 

    def update
        @estudiante = Estudiante.find_signed(params[:token], purpose: "password_reset")
        if @estudiante.update(password_params)
            redirect_to sign_in_path, notice: "Tu contraseña fué cambiada correctamente, por favor ingresa a la plataforma"


        else
            render :edit
        end
    end
    
    private
    def password_params
        params.require(:estudiante).permit(:password, :password_confirmation)
    end
end
