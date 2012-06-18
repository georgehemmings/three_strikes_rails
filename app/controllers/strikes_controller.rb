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

  def update
    strike = Strike.find(params[:id])
    strike.update_attributes(params[:strike])
    strike.save
    respond_with strike
  end
end
