class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.datetime :borrow_time
      t.datetime :return_due_date

      t.timestamps
    end
  end
end
