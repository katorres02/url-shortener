class GeneratorController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def show
    @response = Shortener::Url.read(params[:id])

    respond_to do |format|
      format.html { redirect_to @response }
      format.json { render json: { response: @response }, status: :ok }
    end
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