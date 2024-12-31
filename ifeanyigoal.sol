// SPDX-License-Identifier: MIT

pragma solidity 0.8.1;

contract Todolist{
 

     uint256 public duedate;
     

      struct Task{
        string name;
        string content;
        uint256 dueDate;
        bool completed;
        }
    
     mapping(string => Task) public achive;
     Task[] public tasks;
    
    function addTask(
    string memory _name,
    string memory _content,
    uint256 _dueDate
    ) public {
      Task memory newTask = Task({
        name: _name,
        content: _content,
        dueDate: _dueDate,
        completed: false
        });

        tasks.push(newTask);
        achive[_name] = newTask;

        }

       function completedTask(string memory _name) public {
        Task storage task = achive[_name];
        require(task.completed == false, "Task is completed");

        task.completed = true;
        
       }
       
      
      

}