![USS Casco](https://upload.wikimedia.org/wikipedia/commons/f/f5/USS_Casco.jpg)

The [USS Casco](https://en.wikipedia.org/wiki/USS_Casco_(1864)) was a Union river [monitor](https://en.wikipedia.org/wiki/Monitor_(warship)). This monitor restarts a Heroku instance when triggered with a utility like [PaperTrail](https://papertrailapp.com/).

To set it up, set the following Heroku environment variables:

- `RESTART_WEBHOOK_KEY` - A shared secret you'll use to authenticate with your webhook
- `RESTART_API_KEY` - A Heroku OAuth token with the rights to restart your app
- `VICTIM_APP_NAME` - The name of the Heroku app you want to restart

In PaperTrail, or your choice of monitoring software, set up an alert to call the `/restart?key=<RESTART_WEBHOOK_KEY>` hook and restart your app.
