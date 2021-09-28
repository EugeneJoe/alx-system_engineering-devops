#!/usr/bin/python3
"""
Querries the Reddit API and returns the total number of subscribers for a
given subreddit.
If an invalid subreddit is given, return 0.
"""

import json
import requests


def number_of_subscribers(subreddit):
    """Querries Reddit API and returns total subscribers for a given subreddit,
       or 0 if invalid subreddit given.
    """
    headers = {'user-agent': 'holberton'}
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    subdata = requests.get(url, headers=headers)
    if subdata.status_code != 200:
        return 0
    subdata = json.loads(subdata.text)
    return (subdata.get('data').get('subscribers'))
