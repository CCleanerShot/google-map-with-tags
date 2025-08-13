A collection of 2 apps, a discord bot and a website. The website allows users to send data to an AWS Lambda, and will conditionally store data in an AWS RDS. Events will also cause some lambdas to trigger. Each app will be containerized in Docker, with continuous deployment with GitHub Actions. The following tools/services are used (with changing tools/services based on the branch):

- AWS Lambda
- AWS RDS
- Terraform

- AWS Cloudwatch
- GitHub Actions

# Website

Find restaurants near you that meet match price ranges for certain items, as well as match community-approved tags. Filter for foods that best fit your current mood!

- Phase 1: Sign-Up/Login, Tags, Individual Items, Strict Filtering
- Phase 2: ???

# Discord Bot

Serves as a puesdo admin-dashboard, which will also receive updates about the status of the website, as well as resource-alerts on high loads.

- Phase 1: Basic Admin Dashboard, Resource Alerts
- Phase 2: ???
