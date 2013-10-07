class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :ensure_warm_features

  private
    def ensure_warm_features
      # This is attrocious
      Sound.warm_features!
      Phoneme.warm_features!
    end
end
