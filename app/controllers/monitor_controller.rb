class MonitorController < ApplicationController
  #curid:curcmd['id'],newid:newcmd['id'],newtype:newtype
  # 修改应该加入权限验证，目前还没有
  def set_miner_cmd
    #使用事务修改两条记录，保证有当前可执行命令
    ActiveRecord::Base.transaction do
      curcmd=MinerCmd.find(params[:curid])
      curcmd.enabled=false
      if curcmd.save
        newcmd=MinerCmd.find(params[:newid])
        newcmd.enabled=true
        newcmd.cardType=params[:newtype]
        newcmd.save
        render json:newcmd
      else
        render json:{error:'failed when mod curcmd!'}
      end

    end
  rescue Exception => ex
    puts "transaction abored!"
    puts "errors: #{ex.message}"
    render json:{error:ex.message}
  end
end
