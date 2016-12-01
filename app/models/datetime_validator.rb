class DatetimeValidator < ActiveModel::Validator

  def validate(record)
    Time.parse(record.deadline.to_s)
  rescue  ArgumentError
    record.errors[:deadline] << "is invalid"
  end

end