class StrikesController < ApplicationController

  respond_to :json

  def create
    strike = Strike.create(params[:strike])
    respond_with strike
  end

  def destroy
    strike = Strike.find(params[:id])
    respond_with strike.destroy
  end
end
