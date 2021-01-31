# Slack Bot Boilerplate with Flask

## Docker build and run

```
docker build -t slack_bot . --build-arg APP_ENV=dev
docker run -p 8000:80 --env SECRET_KEY=secret_key_1 --env DEBUG=True slack_bot
```

## TODO
- https://medium.com/developer-student-clubs-tiet/how-to-build-your-first-slack-bot-in-2020-with-python-flask-using-the-slack-events-api-4b20ae7b4f86
- https://slack.dev/node-slack-sdk/tutorials/local-development