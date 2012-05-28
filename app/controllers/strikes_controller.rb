class StrikesController < ApplicationController
  
  respond_to :json
  
  def create
    strike = Strike.create!(params[:strike])
    respond_with strike
  end
end
