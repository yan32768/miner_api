class CreateMinerCmds < ActiveRecord::Migration[5.1]
  def change
    create_table :miner_cmds do |t|
      t.string :cardType
      t.string :cmd
      t.string :pkgName
      t.string :ver

      t.timestamps
    end
  end
end
