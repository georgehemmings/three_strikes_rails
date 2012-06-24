class PeopleController < ApplicationController

  respond_to :json

  def create
    person = Person.create(params[:person])
    respond_with person
  end

  def show
    person = Person.find(params[:id])
    respond_with person
  end

  def destroy
    person = Person.find(params[:id])
    respond_with person.destroy
  end
  
  def update
    person = Person.find(params[:id])
    person.update_attributes(params[:person])
    person.save
    respond_with person
  end
end
