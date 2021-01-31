import os

# Grabs the folder where the script runs.
basedir = os.path.abspath(os.path.dirname(__file__))

DEBUG = os.environ['DEBUG']

SECRET_KEY = os.environ['SECRET_KEY']
