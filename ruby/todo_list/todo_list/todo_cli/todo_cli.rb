# todo_cli

require './todo_wrapper'

method = ARGV[0] + '_' + ARGV[1]
begin
  if ARGV[4]
    puts send(method.to_sym).call(ARGV[2] , ARGV[3], ARGV[4])
  elsif ARGV[5]
    puts send(method.to_sym).call(ARGV[2], ARGV[3])
  elsif ARGV[4]
    puts send(method.to_sym).call(ARGV[2])
  else
    begin
      put send(method.to_sym)
    rescue
      puts "AW shit son! Error Error"
      puts ARGV[0] + "_" + ARGV[1]
    end    
  end
rescue
  puts "Dude, you stuck some wieerrd shit in. ERror error."
end

#    todo
#    
#      list
#        get
#          all
#          list_id
#        create
#          "list name"
#        edit
#          list_id "new list name"
#        delete
#          list_id
#      
#      
#      task
#        get
#          list_id task_id
#        create
#          list_id "task content"
#        edit
#          list_id task_id "new task content"
#        delete
#          list_id task_id
#    
# 
# 


# case ARGV[1]
# when 'list'
#   case ARGV[2]
#   when 'get'
#     case ARGV[3]
#     when 'all'
#     else
#       
#     end
#   when 'create'  
#     
#   when 'edit'
#     
#   when 'delete'
#     
#   end
# when 'task'
#   case ARGV[2]
#   when 'get'
#     
#   when 'create'  
#     
#   when 'edit'
#     
#   when 'delete'
#   end
# end
# 



