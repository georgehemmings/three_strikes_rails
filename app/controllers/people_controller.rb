class PeopleController < ApplicationController
  
  respond_to :json
  
  def create
    person = Person.create(params[:person])
    respond_with person
  end
end
