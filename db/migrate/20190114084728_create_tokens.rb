class CreateTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :tokens do |t|

      t.timestamps
    end
  end
end
