class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :update, :destroy]

  # GET /feeds
  # GET /feeds.json
  def index
    @feeds = Feed.all

    render json: @feeds
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
    render json: @feed
  end

  # POST /feeds
  # POST /feeds.json
  def create
    @user = User.find(params[:user_id])
    @feed = Feed.new(feed_params)
    @user.feeds << @feed

    if @feed.save
      render json: @feed, status: :created
    else
      render json: @feed.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
  def update
    @feed = Feed.find(params[:id])

    if @feed.update(feed_params)
      head :no_content
    else
      render json: @feed.errors, status: :unprocessable_entity
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    @feed.destroy

    head :no_content
  end

  private

    def set_feed
      @feed = Feed.find(params[:id])
    end

    def feed_params
      params.require(:feed).permit(:name, :label, :url, :user_id)
    end
end
