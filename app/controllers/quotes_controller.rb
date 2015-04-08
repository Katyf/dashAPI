class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :update, :destroy]
  def index
    @quotes = Quote.all

    render json: @quotes
  end

  def show
    render json: @quote
  end

  private

    def set_quote
      @quote = Quote.find(params[:id])
    end

    def quote_params
      params.require(:quote).permit(:body, :author)
    end
end
