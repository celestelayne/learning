# todo_wrapper.rb
# By Ethan and Hugo

require 'addressable/uri'
require 'json'
require 'rest_client'

  BASE = "localhost:3000"

  # TODO
  # FIX: deal with param 'all' case    
  def list_get(list_id=nil)
    type = list_id.class
    case type
      when Fixnum
        begin
          path = BASE + "/lists/#{list_id}.json"
          RestClient.get(path)
        rescue
          error = "Error: Unknown list"
        end
      else
        path = BASE + "/lists.json"
        RestClient.get(path)
    end
  end

  # TODO
  # FIX: Deal with param 'all' case
  def task_get(list_id=nil, task_id=nil)
    if task_id == nil
       begin
          path = BASE + "/lists/#{list_id}/tasks.json"
          RestClient.get(path)
        rescue
          error = "Error: Unknown list"
        end
    else
      begin
        path = BASE + "/lists/#{list_id}/tasks/#{task_id}.json"
        RestClient.get(path)
      rescue
        error = "Aw shit son! No Task or list"
      end
    end
  end
  
  
  
  def list_create(list_title="")
    begin
      path = BASE + "/lists.json"
      RestClient.post(path, {list: {title: list_title}})
    rescue
      error = "Unable to Post list"
    end
  end
  
  def task_create(list_id=nil, task_content="")
    begin
      path = BASE + "/lists/#{list_id}/tasks.json"
      RestClient.post(path, {task: {content: task_content}})
    rescue
      error = "Unable to create task"
    end    
  end

  def list_edit(list_id=nil, new_title="")
    begin
      path = BASE + "/lists/#{list_id}.json"
      RestClient.put(path, {list: {title: new_title} })
    rescue
      p "ERROR: Failed to edit list"
    end
    
  end
  
  def task_edit(list_id=nil, task_id=nil, new_content="")
    begin  
      path = BASE + "/lists/#{list_id}/tasks/#{task_id}.json"
      RestClient.put(path, {list: {task: {content: new_content }}})
    rescue
      p "ERROR: Failed to edit task"
    end
  end
  
  def list_delete(list_id=nil)
    path = BASE + "/lists/#{list_id}.json"
    RestClient.delete(path)
    p 'list deleted'
  end
  
  def task_delete(list_id=nil, task_id=nil)
    path = BASE + "/lists/#{list_id}/tasks/#{task_id}.json"
    RestClient.delete(path)
    p 'Task DELETED!!'
  end
   