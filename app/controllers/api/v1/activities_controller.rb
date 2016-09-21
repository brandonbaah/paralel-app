class Api::V1::ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end
end
