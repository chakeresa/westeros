class SearchController < ApplicationController
  def index
    house_id = params[:house]
    render locals: {
      facade: SearchIndexFacade.new(house_id)
    }
  end
end
