class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to campus_path, notice: "Sesión iniciada exitósamente"
        else
            flash[:alert] = "Correo o contraseña inválida"
            render :new
        end
        
    end

    def destroy
        session[:user_id] = nil 
        redirect_to root_path, notice: "Sesión terminada"
    
    end
end