class AddReferencesToTickets < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :passenger, foreign_key: true
  end
end
