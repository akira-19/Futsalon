class TournamentsController < ApplicationController

  def index
    @tournaments = Tournament.all
    # @level =
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  def search
    fields = params[:prefecture].empty? ? Field.all : Field.where(prefecture: params[:prefecture])
    date = params[:date].to_date
    @tournaments = Tournament.where(field_id: fields.pluck(:id))
                              .where(start_time: date.beginning_of_day .. date.end_of_day)
    render :index
  end

  def prefecture
  end

end
