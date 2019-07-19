class WelcomeController < ApplicationController
  def index
    render locals: {
      facade: WelcomeIndexFacade.new
    }
  end
end
