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
      colspan_array_component = get_colspan_for_a_day(date, @field_bookings.where(field_id: fld.id))
      @colspan_array.push([fld.id, colspan_array_component])
    end

    @initial_data = {prefecture: params[:prefecture], date: params[:date]}
    @colspan_array = Kaminari.paginate_array(@colspan_array).page(params[:page]).per(15)

    render :index
  end

  private
    #get team name arrays.
    def get_team_name(booking_array, time)
      team_name_array = []
      booking_array.each do |b_ary|
        if time == b_ary.start_time
          team_name_array.push b_ary.team.name
        elsif (time > b_ary.start_time) and (time < b_ary.end_time)
          team_name_array.push ''
        else
          team_name_array.push ''
        end
      end
      return team_name_array
    end

    #get condition(the value of colspan) arrays.
    def get_colspan_condition(booking_array, time)
      cond_array = []
      booking_array.each do |b_ary|
        if time == b_ary.start_time
          cond_array.push(((b_ary.end_time - b_ary.start_time)/1800.0).to_i)
        elsif (time > b_ary.start_time) and (time < b_ary.end_time)
          cond_array.push 0
        else
          cond_array.push 100
        end
      end
      return cond_array
    end

    # combine team name and booking time, then make array comonents
    def create_booking_info_array(colspan_condition_array, team_name_array)
      colspan_condition_array.each do |ca|
        unless (ca == 0) or (ca == 100)
          time_index = colspan_condition_array.find_index ca
          team_name_and_time = [ca, team_name_array[time_index]]
          return team_name_and_time
        end
      end
    end

    # conbine all array components, which are colspan value and team names if there is a reservation.
    def get_colspan_array_component(colspan_condition_array, team_name_and_time)
      if colspan_condition_array.all? {|ca| ca == 100}
        colspan_array_component = [1,'○']
      elsif colspan_condition_array.include? 0
        return
      else
        colspan_array_component = team_name_and_time
      end
      return colspan_array_component
    end

    def get_colspan_for_a_day(date, booking_array)
      colspan_array_component = []
      (1..30).each do |n|
        time = date.in_time_zone + 6.hours + (30 * (n + 1)).minutes
        team_name_array = get_team_name(booking_array, time)
        colspan_condition_array = get_colspan_condition(booking_array, time)
        team_name_and_time = create_booking_info_array(colspan_condition_array, team_name_array)
        if get_colspan_array_component(colspan_condition_array, team_name_and_time)
          colspan_array_component.push(get_colspan_array_component(colspan_condition_array, team_name_and_time))
        end
      end
      return colspan_array_component
    end

end
