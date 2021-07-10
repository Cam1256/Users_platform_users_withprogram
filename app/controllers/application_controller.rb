class ApplicationController < ActionController::Base

    before_action :set_current_estudiante
    
    def set_current_estudiante
        if session[:estudiante_id]
            Current.estudiante = Estudiante.find_by(id: session[:estudiante_id])
        end
    end

    def require_estudiante_logged_in!
        redirect_to sign_in_path, alert: "Debes haber iniciado sesión" if Current.estudiante.nil?
    end
end
