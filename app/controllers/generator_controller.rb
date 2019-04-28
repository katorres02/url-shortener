class GeneratorController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def show
    @response = Shortener::Url.read(params[:id])
    if @response[:status] == :ok
      respond_to do |format|
        format.html { redirect_to @response[:url] }
        format.json { render json: { url: @response[:url] }, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render html: 'Invalid short url' }
        format.json { render json: { message: @response.message }, status: :ok }
      end
    end
  end

  def create
    url = params[:url]
    @response = Shortener::Url.generate(url)
    render json: { response: @response }, status: :ok
  end

  def top
    @urls = ShortenerUrl.order(visits: :desc).limit(100)
  end
end