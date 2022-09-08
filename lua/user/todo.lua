local todo_ok, todo = pcall(require, "todo-comments")
if (todo_ok) then
  todo.setup()
end
