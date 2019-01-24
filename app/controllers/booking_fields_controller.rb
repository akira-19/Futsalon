class BookingFieldsController < ApplicationController
  def index
    @booking_fields = BookingField.all
  end

  def new
    # From user input
    @booking_date = booking_field_params[:date].in_time_zone + 7.hours + (booking_field_params[:time].to_i*30).minutes
    @booking_time = [7 + (booking_field_params[:time].to_i*0.5).to_i, (booking_field_params[:time].to_i%2) * 30]
    @field = Field.find_by(id: booking_field_params[:field].to_i)
    @price = @field.price

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
    current_team = Team.find_by(id: booking_field_params[:team].to_i)
    field = Field.find_by(id: booking_field_params[:field].to_i)

    date = booking_field_params[:date]
    begin_time_h = booking_field_params[:time_begin_h].to_i
    begin_time_m = booking_field_params[:time_begin_m].to_i
    end_time_h = booking_field_params[:time_end_h].to_i
    end_time_m = booking_field_params[:time_end_m].to_i

    begin_time = Time.zone.parse("#{date} #{begin_time_h}:#{begin_time_m}")
    end_time = Time.zone.parse("#{date} #{end_time_h}:#{end_time_m}")

    amount = get_amount_of_price(field, begin_time_h, begin_time_m, end_time_h, end_time_m)
    Payjp.api_key = Rails.application.secrets.PAYJP_SECRET_KEY
    Payjp::Charge.create(currency: 'jpy', amount: amount.to_i, card: params['payjp-token'])

    booking_field = BookingField.new(team_id: current_team.id,
                                    field_id: field.id,
                                    start_time: begin_time,
                                    end_time: end_time,
                                    price: amount,
                                    payment_method: 1,
                                    payment: true,
                                    confirm: true)

    if booking_field.save!
      redirect_to root_path, notice: "支払いが完了しました"
    end
  end

  private
    def get_amount_of_price(field, begin_time_h, begin_time_m, end_time_h, end_time_m)
      hourly_price = field.price
      return ((end_time_h - begin_time_h) + (end_time_m - begin_time_m)/60.0) * hourly_price
    end

    def booking_field_params
      params.permit(:date, :team, :field, :time_begin_h, :time_begin_m, :time_end_h, :time_end_m)
    end



end
