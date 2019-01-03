class FieldsController < ApplicationController
  def index
  end

  def show

  end

  def search
    # parameters that are from form_with
    @fields = params[:prefecture].empty? ? Field.all : Field.where(prefecture: params[:prefecture])
    date = params[:date].to_date

    # BookingField objects that meet conditions (place and date)
    @field_bookings = Field.reserved_slots(@fields, date)

    # table colspan information
    @colspan_array = []

    # get table colspan information from reservation
    @fields.each do |fld|
      booking_array = @field_bookings.where(field_id: fld.id)
      colspan_array_component = []

      if !booking_array.empty?
        (1..30).each do |n|
          team_name_array = []
          cond_array = []
          time = date.in_time_zone + 6.hours + (30 * (n + 1)).minutes

          get_booking_info(booking_array, time, team_name_array, cond_array)

          create_booking_info_array(cond_array, team_name_array)

          get_colspan_array_component(cond_array, colspan_array_component, @team_name_and_time)

        end
      else
        # When there is no researvation, just adding a circle in each td tag
        30.times do
          colspan_array_component.push [1, '○']
        end
      end
    @colspan_array.push([fld.id, colspan_array_component])
    end
    @initial_data = {prefecture: params[:prefecture], date: params[:date]}
    render :index
  end

  private
    #get team name and condition(the value of colspan) arrays.
    def get_booking_info(booking_array, time, team_name_array, cond_array)
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
    end

    # combine team name and booking time, then make array comonents
    def create_booking_info_array(cond_array, team_name_array)
      cond_array.each do |ca|
        unless (ca == 0) or (ca == 100)
          time_index = cond_array.find_index ca
          @team_name_and_time = [ca, team_name_array[time_index]]
        end
      end
    end

    # conbine all array components, which are colspan value and team names if there is a reservation.
    def get_colspan_array_component(cond_array, colspan_array_component, team_name_and_time)
      if cond_array.all? {|ca| ca == 100}
        colspan_array_component.push [1,'○']
      elsif cond_array.include? 0

      else
        colspan_array_component.push team_name_and_time
      end
    end

end
