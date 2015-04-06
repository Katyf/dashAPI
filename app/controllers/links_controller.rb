class LinksController < ApplicationController
  before_action :set_link, only: [:show, :update, :destroy]

  # GET /links
  # GET /links.json
  def index
    @links = Link.all

    render json: @links
  end

  # GET /links/1
  # GET /links/1.json
  def show
    render json: @link
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)

    if @link.save
      render json: @link, status: :created, location: @link
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    @link = Link.find(params[:id])

    if @link.update(link_params)
      head :no_content
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy

    head :no_content
  end

  private

    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:url, :User_id)
    end
end
