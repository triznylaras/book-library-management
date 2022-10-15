json.extract! book, :id, :title, :author, :borrow_time, :return__due_date, :created_at, :updated_at
json.url book_url(book, format: :json)