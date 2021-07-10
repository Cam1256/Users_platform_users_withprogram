
class RegistrationsController < ApplicationController
        def new
            @estudiante = Estudiante.new

        end

        def create
            @estudiante =Estudiante.new(estudiante_params)
            if @estudiante.save
                session[:estudiante_id] = @estudiante.id
                redirect_to root_path, notice: "Cuenta creada exitósamente"
            else
                
                render :new
            end
            
        end

        private

        def estudiante_params
            params.require(:estudiante).permit(:nombre, :apellido, :identificacion, :email, :password, :password_confirmation, :programa)
        end
            
    end