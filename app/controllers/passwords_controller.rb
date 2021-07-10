class PasswordsController < ApplicationController

    before_action :require_estudiante_logged_in!

    def edit
    end

    def update
        if Current.estudiante.update(password_params)
            redirect_to root_path, notice: "Contraseña cambiada exitósamente"

        else
            render :edit
        end
    end

    private 

    def password_params
        params.require(:estudiante).permit(:password, :password_confirmation)
    end 
end 