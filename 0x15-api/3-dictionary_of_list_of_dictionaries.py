#!/usr/bin/python3
"""
Script that accepts an employee ID and returns information about
their TODO list progress
"""
import json
import requests
from sys import argv

if __name__ == "__main__":
    url1 = "https://jsonplaceholder.typicode.com/users/"
    users = requests.get(url1)
    users = json.loads(users.text)
    data = {}
    for user in users:
        temp = []
        url = "https://jsonplaceholder.typicode.com/users/{}/todos".format(
            user['id'])
        todo = requests.get(url)
        todo = json.loads(todo.text)
        for item in todo:
            if item['userId'] == user['id']:
                dict = {"username": user['username'],
                        "task": item['title'],
                        "completed": item['completed']}
                temp.append(dict)
        data[user['id']] = temp
    with open('todo_all_employees.json', mode='w') as json_file:
        json.dump(data, json_file)
