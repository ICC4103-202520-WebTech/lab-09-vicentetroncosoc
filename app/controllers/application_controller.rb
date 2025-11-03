class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Agrega esto para tener `can?` en controladores y vistas
  include CanCan::ControllerAdditions

  rescue_from CanCan::AccessDenied do
    redirect_back fallback_location: root_path, alert: "No tienes permiso para hacer eso."
  end
end

