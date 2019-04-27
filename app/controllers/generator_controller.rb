class GeneratorController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def show
    @response = Shortener::Url.read(params[:id])
    render json: { response: @response }, status: :ok
  end

  def create
    url = params[:url]
    @response = Shortener::Url.generate(url)
    render json: { response: @response }, status: :ok
  end

  def top
    # 100 most visited
  end
end