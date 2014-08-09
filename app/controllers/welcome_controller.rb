class WelcomeController < ApplicationController
  def index

    if session['access_token'] && session['access_token_secret']
      redirect_to followfriday_path
    end

  end
end
