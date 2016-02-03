today = Date.today
next_date = today + 1.year

User.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

user = User.create! [
                 { username: "Fiorina", password_digest: "pass1" },
                 { username: "Trump", password_digest: "pass2" },
                 { username: "Carson", password_digest: "pass3" },
                 { username: "Clinton", password_digest: "pass4" },
             ]

Profile.create! [
                    { first_name:"Carly", last_name: "Fiorina", gender: "female", birth_year: 1954, created_at: "", updated_at: "", user_id: User.find_by_username('Fiorina') },
                    { first_name:"Donald", last_name: "Trump", gender: "male", birth_year: 1946, created_at: "", updated_at: "", user_id: User.find_by_username('Trump') },
                    { first_name: "Ben", last_name: "Carson", gender: "male", birth_year: 1951, created_at: "", updated_at: "", user_id: User.find_by_username('Carson') },
                    { first_name: "Hillary", last_name: "Clinton", gender:"female", birth_year: 1947, created_at: "", updated_at: "", user_id: User.find_by_username('Clinton') }
                ]

TodoList.create! [
                     { list_name: "Big deal1", list_due_date: next_date, created_at: "", updated_at: "", user: User.find_by_username('Fiorina') },
                     { list_name: "Big deal2", list_due_date: next_date, created_at: "", updated_at: "", user: User.find_by_username('Trump') },
                     { list_name: "Big deal3", list_due_date: next_date, created_at: "", updated_at: "", user: User.find_by_username('Carson') },
                     { list_name: "Big deal4", list_due_date: next_date, created_at: "", updated_at: "", user: User.find_by_username('Clinton') }
                 ]



(1..5).each do |item|
  TodoItem.create! [
                       { title: "Task 1", due_date: next_date, description: "very important task1 #{item}", todo_list_id: (TodoList.find_by(user: User.find_by(username:'Fiorina'))), completed: true },
                       { title: "Task 2", due_date: next_date, description: "very important task2#{item}", todo_list_id: (TodoList.find_by(user: User.find_by(username: 'Trump'))), completed: true },
                       { title: "Task 3", due_date: next_date, description: "very important task3#{item}", todo_list_id: (TodoList.find_by(user: User.find_by(username: 'Carson'))), completed: true },
                       { title: "Task 4", due_date: next_date, description: "very important task4#{item}", todo_list_id: (TodoList.find_by(user: User.find_by(username:'Clinton'))), completed: true }
                   ]
end