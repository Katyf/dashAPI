class SettingsController < ApplicationController
  before_action :set_setting, only: [:show, :update, :destroy]

  # GET /settings
  # GET /settings.json
  def index
    @settings = Setting.all

    render json: @settings
  end

  # GET /settings/1
  # GET /settings/1.json
  def show
    render json: @setting
  end

  # POST /settings
  # POST /settings.json
  def create
    @setting = Setting.new(setting_params)
    @user = User.find(params[:user_id])
    @user.settings << @setting

    if @setting.save
      render json: @setting, status: :created
    else
      render json: @setting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /settings/1
  # PATCH/PUT /settings/1.json
  def update
    @setting = Setting.find(params[:id])

    if @setting.update(setting_params)
      head :no_content
    else
      render json: @setting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /settings/1
  # DELETE /settings/1.json
  def destroy
    @setting.destroy

    head :no_content
  end

  private

    def set_setting
      @setting = Setting.find(params[:id])
    end

    def setting_params
      params.require(:setting).permit(:themes, :feeds, :User_id)
    end
end
