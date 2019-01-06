class CreateMiners < ActiveRecord::Migration[5.1]
  def change
    create_table :miners do |t|
      t.string :rigName
      t.string :minerPath
      t.string :cardType
      t.string :serverIp
      t.string :piIp
      t.string :localOpts
      t.string :sts
      t.boolean :enabled

      t.timestamps
    end
  end
end
