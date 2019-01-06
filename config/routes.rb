Rails.application.routes.draw do
  resources :version_cfgs
  resources :miners
  resources :miner_cmds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'get_cmd' =>'miner_cmds#get_cmd' #获取矿机执行指令
  get 'get_ver' =>'version_cfgs#get_ver' # 版本检查，获取更新版本文件列表
end
