class ChannelsController < ApplicationController
  require 'npr'

  def index
    @channels= Channel.all
  end

  def show
    @channel = Channel.find(params[:id])
    @hash = NPR.get_latest(@channel)
  end
end
