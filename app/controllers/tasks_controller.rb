class TasksController < ApplicationController
  def index
    render json: "OK", status: 200
  end
end