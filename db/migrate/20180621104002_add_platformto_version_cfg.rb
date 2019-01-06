class AddPlatformtoVersionCfg < ActiveRecord::Migration[5.1]
  def change
    add_column :version_cfgs,:platform,:string
  end
end
