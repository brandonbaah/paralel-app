class ActivitiesController < ApplicationController
  def index
    @activities = Actvity.all
    @activities = @activities.order(updated_at: :desc)
  end
end
