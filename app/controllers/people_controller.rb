class PeopleController < ApplicationController
  def index
    @person = People.new
    @people = People.all
  end

  def create
  end

  def destroy
  end
end
