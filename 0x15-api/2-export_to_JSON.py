#!/usr/bin/python3
"""
Script that accepts an employee ID and returns information about
their TODO list progress
"""
import json
import requests
from sys import argv

if __name__ == "__main__":
    url1 = "https://jsonplaceholder.typicode.com/users/{}".format(argv[1])
    url2 = "https://jsonplaceholder.typicode.com/users/{}/todos".format(
        argv[1])
    user = requests.get(url1)
    todo = requests.get(url2)
    user = json.loads(user.text)
    todo = json.loads(todo.text)
    temp = []
    for item in todo:
        dict = {"task": item['title'], "completed": item['completed'],
                "username": user['username']}
        temp.append(dict)
    data = {user['id']: temp}
    with open('{}.json'.format(argv[1]), mode='w') as json_file:
        json.dump(data, json_file)
