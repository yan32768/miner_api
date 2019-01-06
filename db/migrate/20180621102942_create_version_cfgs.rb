class CreateVersionCfgs < ActiveRecord::Migration[5.1]
  def change
    create_table :version_cfgs do |t|
      t.integer :ver
      t.string :files
      t.string :remarks
      t.boolean :enabled

      t.timestamps
    end
  end
end
