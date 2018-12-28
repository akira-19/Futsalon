class BookingFieldsController < ApplicationController
  def index
    @booking_fields = BookingField.all
  end

  def new
    @booking_date = params[:date].in_time_zone + 7.hours + (params[:time].to_i*30).minutes
    @booking_time = [7 + (params[:time].to_i*0.5).to_i, (params[:time].to_i%2) * 30]
    @field_name = Field.find_by(id: params[:field].to_i).name
    @price = Field.find_by(id: params[:field].to_i).price
    @booking_field = BookingField.new
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

  def purchase
    Payjp.api_key = PAYJP_SECRET_KEY
    Payjp::Charge.create(currency: 'jpy', amount: 1000, card: params['payjp-token'])
    redirect_to root_path, notice: "支払いが完了しました"
  end

end
