class Book < ApplicationRecord
  validates :title, :author, :borrow_time, :return_due_date, presence: true
end
