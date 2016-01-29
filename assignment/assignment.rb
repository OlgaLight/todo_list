require_relative '../config/environment'

class Assignment

  def create_user(params)
    User.create(:username => params[:username], :password_digest => params[:password_digest])
  end

  def create_todolist(params)
    TodoList.create(:list_name => params[:name], :list_due_date => params[:due_date])
  end

  def find_allusers(offset, limit)
    User.all.order(:updated_at).offset(offset).limit(limit).to_a
  end

  def find_alllists(offset, limit)
    TodoList.all.order(:list_due_date => :desc).offset(offset).limit(limit).to_a
  end

  def find_user_byname(username)
    User.where(:username => username).to_a
  end

  def find_todolist_byname(name)
    TodoList.where(:list_name => name)
  end

  def get_user_byid(id)
    User.find_by_id(id)
  end

  def get_todolist_byid(id)
    TodoList.find_by_id(id)
  end

  def update_password(id, password_digest)
    get_user_byid(id).update(:password_digest => password_digest)
  end

  def update_listname(id, name)
    get_todolist_byid(id).update(:list_name => name)
  end

  def delete_user(id)
    User.destroy(id)
  end

  def delete_todolist(id)
    TodoList.destroy(id)
  end
end
