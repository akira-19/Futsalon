class TournamentsController < ApplicationController

  def index
    @tournaments = Tournament.all.order(:start_time)
    @number_of_booking = {}
    @tournaments.each do |t|
      count = BookingTournament.where(tournament_id: t.id).count
      @number_of_booking.store(t.id, count)
    end
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
    @tournament = Tournament.find_by(id: params[:id])
    @number_of_booking = BookingTournament.where(tournament_id: @tournament.id).count
  end

  def destroy
  end

  def search
    fields = params[:prefecture].empty? ? Field.all : Field.where(prefecture: params[:prefecture])
    date = params[:date].to_date
    @tournaments = Tournament.search_tournament(fields, date)
    @initial_data = {prefecture: params[:prefecture], date: params[:date]}
    @number_of_booking = {}
    @tournaments.each do |t|
      count = BookingTournament.where(tournament_id: t.id).count
      @number_of_booking.store(t.id, count)
    end
    render :index
  end

  def purchase
    Payjp.api_key = Rails.application.secrets.PAYJP_SECRET_KEY
    Payjp::Charge.create(currency: 'jpy', amount: 1000, card: params['payjp-token'])
    redirect_to root_path, notice: "支払いが完了しました"
  end

  def prefecture
  end

  # ストロングパラメータ
end
