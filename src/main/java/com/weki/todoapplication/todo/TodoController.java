package com.weki.todoapplication.todo;

import jakarta.validation.Valid;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.List;

@Controller
public class TodoController {

    private final TodoRepository service;

    public TodoController(TodoRepository service) {
        this.service = service;
    }

    @RequestMapping(value = "/list-todos", method = RequestMethod.GET)
    public String getAllTodosByUsername(ModelMap model) {
        List<Todo> todos = service.findAllByUsername(getLoggedInUsername());
        model.put("todos", todos);
        return "listTodos";
    }

    @RequestMapping(value = "/add-todo", method = RequestMethod.GET)
    public String showAddTodoPage(ModelMap model) {
        Todo todo = new Todo(0, getLoggedInUsername(), "", LocalDate.now());
        model.addAttribute("todo", todo);
        return "todo";
    }

    @RequestMapping(value = "/add-todo", method = RequestMethod.POST)
    public String addNewTodo(ModelMap model, @Valid Todo todo, BindingResult result) {

        if(result.hasErrors()) {
            return "todo";
        }

        todo.setUsername(getLoggedInUsername());
        service.save(todo);
        return "redirect:list-todos";
    }

    @RequestMapping(value = "/delete-todo", method = RequestMethod.GET)
    public String deletUserById(@RequestParam Integer id) {
        service.deleteById(id);
        return "redirect:list-todos";
    }

    @RequestMapping(value = "/update-todo", method = RequestMethod.GET)
    public String showUpdatePage(@RequestParam Integer id, ModelMap model) {

        Todo todo = service.findById(id).get();

        todo.setUsername(getLoggedInUsername());
        model.addAttribute("todo", todo);

        return "todo";
    }

    @RequestMapping(value = "/update-todo", method = RequestMethod.POST)
    public String updateTodo(ModelMap model, @Valid Todo todo, BindingResult result) {

        if(result.hasErrors()) {
            return "todo";
        }

        todo.setUsername(getLoggedInUsername());
        service.save(todo);

        return "redirect:list-todos";
    }



    public String getLoggedInUsername() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        return username;
    }
}
