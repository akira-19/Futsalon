class BookingFieldsController < ApplicationController
  def index
    @booking_fields = BookingField.all
  end

  def new
    # From user input
    @booking_date = params[:date].in_time_zone + 7.hours + (params[:time].to_i*30).minutes
    @booking_time = [7 + (params[:time].to_i*0.5).to_i, (params[:time].to_i%2) * 30]
    @field = Field.find_by(id: params[:field].to_i) # findを検討
    @price = @field.price # わざわざインスタンス変数を定義しなくてもいいかも

    @booking_field = BookingField.new
  end

  # 最終的に使用しないアクションは削除した方が良い
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
    current_team = Team.find_by(id: params[:team].to_i)
    field = Field.find_by(id: params[:field].to_i)

    date = params[:date]
    begin_time_h = params[:time_begin_h].to_i
    begin_time_m = params[:time_begin_m].to_i
    end_time_h = params[:time_end_h].to_i
    end_time_m = params[:time_end_m].to_i

    # Time.zone.parseの処理をメソッドにしてもいいかも　->　テストしやすくなる（自動テストにこだわらなければそのままで良いと思う）
    begin_time = Time.zone.parse("#{date} #{begin_time_h}:#{begin_time_m}")
    end_time = Time.zone.parse("#{date} #{end_time_h}:#{end_time_m}")
    hourly_price = field.price

    # この算出処理をメソッドかしてもいいかも　->　テストしやすくなる
    amount = ((end_time_h - begin_time_h) + (end_time_m - begin_time_m)/60.0) * hourly_price
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
  def purchase_params
    # できればストロングパラメータを使用する
  end

end
