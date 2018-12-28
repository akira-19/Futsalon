class FieldsController < ApplicationController
  def index
    # @fields = Field.all
  end

  def show
    
  end

  def search
    @fields = params[:prefecture].empty? ? Field.all : Field.where(prefecture: params[:prefecture])
    date = params[:date].to_date

    # BookingField objects that meet conditions (place and date)
    @field_bookings = BookingField.where(field_id: @fields.pluck(:id))
                              .where("start_time >= ? AND start_time < ?", date, date + 1)

    @colspan_array = []
    @fields.each do |fld|
      booking_array = @field_bookings.where(field_id: fld.id)
      colspan_array_component = []
      if !booking_array.empty?
        (1..30).each do |n|
          team_name_array = []
          cond_array = []
          time = date.in_time_zone + 6.hours + (30 * (n + 1)).minutes

          booking_array.each do |b_ary|
            if time == b_ary.start_time
              team_name_array.push b_ary.team.name
              cond_array.push(((b_ary.end_time - b_ary.start_time)/1800.0).to_i)
            elsif (time > b_ary.start_time) and (time < b_ary.end_time)
              team_name_array.push ''
              cond_array.push 0
            else
              team_name_array.push ''
              cond_array.push 100
            end
          end

          cond_array.each do |ca|
            unless (ca == 0) or (ca == 100)
              time_index = cond_array.find_index ca
              @team_name_time = [ca, team_name_array[time_index]]
            end
          end



          if cond_array.all? {|ca| ca == 100}
            colspan_array_component.push [1,'○']
          elsif cond_array.include? 0

          else
            colspan_array_component.push @team_name_time
          end


        end


      else
        30.times do
          colspan_array_component.push [1, '○']
        end
      end
    @colspan_array.push([fld.id, colspan_array_component])
    end
    @initial_data = {prefecture: params[:prefecture], date: params[:date]}
    render :index
  end

end
