A collection of 2 apps, a discord bot and a website. The website allows users to send data to an AWS Lambda, and will conditionally store data in an AWS RDS. Events will also cause some lambdas to trigger. AWS Cloudwatch will cause the discord bot to emit notifications from certain resource events (example: the resources fail, or are near capacity) to the listed users. Each app will be containerized in Docker, with continuous deployment with GitHub Actions. The following tools/services are used (with changing tools/services based on the branch):

- AWS Lambda
- AWS RDS
- Terraform

- AWS Cloudwatch
- GitHub Actions
