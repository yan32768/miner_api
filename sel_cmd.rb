require 'json'
require 'rest-client'
serverip='localhost:3000'

def check_ver(serverip,cardtype)
  p 'check current version ...'
  begin
    response=RestClient.get 'http://'+serverip+'/get_cmd', {:params => {:rigName => '', :cardType => cardtype}}
    if response.code==200
      JSON.parse(response.to_s)
    else
      nil #返回空
    end

  rescue =>ex
    puts ex.message

  end


end

def get_cmds(serverip)
  p 'get all cmds ...'
  begin
    response=RestClient.get 'http://'+serverip+'/miner_cmds'
    if response.code==200
      cmds=JSON.parse(response.to_s)
    else
      nil #返回空
    end

  rescue =>ex
    puts ex.message

  end
  cmds.each do|cmd|
    p 'id:'+cmd['id'].to_s+' cardType:'+cmd['cardType']+' ver:'+cmd['ver']
  end
  cmds
end
# 提示是否修改cmd参数，比较长，默认不改
def newcmdline(curcmd,serverip)
  print 'please input new cmdline:(enter for skip) '
  newcmdline=$stdin.gets.chomp
  if newcmdline!=''
    curcmd['cmd']=newcmdline
    #只更新一个参数
    response=RestClient.patch "http://#{serverip}/miner_cmds/#{curcmd['id']}",{miner_cmd:{cmd:newcmdline}}
    if response.code==200
      p 'op call success！'
      cmd=JSON.parse(response.to_s)
      p cmd['cmd']
    else
      p 'op call failed!'
      p response.to_s
    end
  end
end
#选择另一条指令为当前指令，一般为另一个币种,修改cardtype和enabled两个参数
def anothercmd(curcmd,serverip)

  cmds=get_cmds(serverip)

  print "please select id of will run cmd:(#{curcmd['id']})"
  newid=$stdin.gets.chomp
  newid=curcmd['id'].to_s if newid==''
  p 'you new id is '+newid

  newcmd=cmds.select{|cmd|cmd['id'].to_s==newid}.first
  p newcmd.to_s

  print "please input type of newid:(#{newcmd['cardType']})"
  newtype=$stdin.gets.chomp
  newtype=newcmd['cardType'] if newtype==''

  #将curcmd enabled标记为false,修改newcmd的类型和enabled两个参数
  response=RestClient.patch "http://#{serverip}/set_miner_cmd",{curid:curcmd['id'],newid:newcmd['id'],newtype:newtype}
  if response.code==200
    p 'op call success!'
    p response.to_s
  else
    p 'op call failed!'
    p response.to_s
  end
end

print "please select cardtype will be changed:(470)"
cardtype=$stdin.gets.chomp
cardtype='470' if cardtype==''

curcmd=check_ver serverip,cardtype
p curcmd['ver']
p curcmd['cmd']
#两个常用操作，修改当前使用的cmd版本，或者只刷新当前使用cmd的命令行
print "please select mod type 1:newcmdline,2:select another cmd:(1)"
newid=$stdin.gets.chomp
if newid=='1'||newid==''
  newcmdline(curcmd,serverip)
elsif newid=='2'
  anothercmd(curcmd,serverip)
end




