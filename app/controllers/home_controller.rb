class HomeController < ApplicationController
  def index
    @events = Event.all.reverse
  end
end