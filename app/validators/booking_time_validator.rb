class BookingTimeValidator < ActiveModel::Validator
  def validate(record)
    overlapped_schedules = BookingField
                            .where(field_id: record.field_id)
                            .where("end_time > ?", record.start_time)
                            .where("start_time < ?", record.end_time)
                            .where.not(id: record.id)

    if overlapped_schedules.exists?
      record.errors.add :base, "Booking must not overlap on other bookings"
    end
  end
end
