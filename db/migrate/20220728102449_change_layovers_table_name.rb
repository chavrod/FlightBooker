class ChangeLayoversTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :layovers, :tickets
  end
end
