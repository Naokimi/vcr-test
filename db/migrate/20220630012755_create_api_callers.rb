class CreateApiCallers < ActiveRecord::Migration[6.1]
  def change
    create_table :api_callers do |t|

      t.timestamps
    end
  end
end
