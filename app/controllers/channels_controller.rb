class ChannelsController < ApplicationController
  require 'open-uri'

  def index
    @channels= Channel.all
  end

  def show
    @channel = Channel.find(params[:id])
    @hash = get_latest(@channel)
  end

  def get_latest(channel)
    url = "http://api.npr.org/query?id=98679384&fields=show,audio,multimedia,titles,song,album,text&apiKey=#{Rails.configuration.x.api_key}&output=json"
    buffer = open(url).read
    hash = JSON.parse(buffer)
  end
end
