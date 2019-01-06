class AddEnableToMinerCmds < ActiveRecord::Migration[5.1]
  def change
    add_column :miner_cmds,:enabled,:boolean
  end
end
