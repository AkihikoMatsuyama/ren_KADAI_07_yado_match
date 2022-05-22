class Reservation < ApplicationRecord
  belongs_to :room, optional: true
  
  validates :start_day, presence: true
  validate :date_before_start
  def date_before_start
    return if start_day.blank?
    errors.add(:start_day, "は本日以降の日付を選択してください") if start_day <= Date.yesterday
  end

  validates :end_day, presence: true
  validate :date_before_end
  def date_before_end
    return if end_day.blank? || start_day.blank?
    errors.add(:end_day, "は開始日以後の日付を選択してください") if end_day <= start_day
  end

  validates :person, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
