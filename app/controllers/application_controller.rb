class ApplicationController < ActionController::API
  def healthz
    render json: "OK", status: 200
  end
end
