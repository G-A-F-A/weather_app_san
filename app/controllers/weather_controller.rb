class WeatherController < ApplicationController
  before_action :set_connection

  def index
    @res = @connection.get do |req|
      req.url '/data/2.5/weather'
      req.params[:q] = 'shibuya,jp'
      req.params[:appid] = ENV['WEATHER_API_KEY']
      req.params[:units] = 'metric'
    end
    binding.pry
  end

  def show
  end

  private

    def set_connection
      @connection = Faraday.new(url: ENV['WEATHER_API_URL'])
    end
end
