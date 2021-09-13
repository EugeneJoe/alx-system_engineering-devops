#!/usr/bin/python3
"""
Script that accepts an employee ID and returns information about
their TODO list progress
"""
import requests
import json
from sys import argv

if __name__ == "__main__":
    url1 = "https://jsonplaceholder.typicode.com/users/{}".format(argv[1])
    url2 = "https://jsonplaceholder.typicode.com/users/{}/todos".format(
        argv[1])
    user = requests.get(url1)
    todo = requests.get(url2)
    user = json.loads(user.text)
    todo = json.loads(todo.text)
    total = 0
    done = 0
    tasks = []
    for item in todo:
        total += 1
        if item['completed']:
            done += 1
            tasks.append(item['title'])
    first = "Employee {} is done with tasks({}/{}):".format(user['name'],
                                                            done, total)
    print(first)
    for item in tasks:
        print("\t {}".format(item))
