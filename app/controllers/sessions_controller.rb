class SessionsController < ApplicationController

    

    def new
    end

    def create
        estudiante =Estudiante.find_by(email: params[:email])
        if estudiante.present? && estudiante.authenticate(params[:password])
            session[:estudiante_id] = estudiante.id
            redirect_to campusadmin_path, notice: "Sesión iniciada exitósamente"
        else
            flash[:alert] = "Correo o contraseña inválida"
            render :new
        end
        
    end

    def destroy
        session[:estudiante_id] = nil 
        redirect_to root_path, notice: "Sesión terminada"
    
    end
end