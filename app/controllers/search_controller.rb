class SearchController < ApplicationController
  def index
    house = params[:house]
    render locals: {
      facade: SearchIndexFacade.new(house)
    }
  end
end
