Creation of the Cronjob
- the cronjob is create to make regular backups once at between 00 : 00 and 01 : 00.
- it is created to make buckups of postgres database data.
- integrated with amazon-s3 bucket

Creation of the secrets
- first go to https://kubernetes.io/docs/concepts/configuration/secret/
- then visit the 'create your own secrets' part
- if you want to do it manually then there is a section under 'create your own secrets' that you can follow. 
- after you have followed the steps provided there your secret will be created
--NOTE Make sure you are in the correct directory when you want to upload the private information.
--NOTE Secondly make sure on kubernetes dashboard that the values in your secret is correctly encoded. This might only be a Windows problem, but just make sure that your encoding have been done properly. TIP when you end your secret and there is to '//' characters before the key tou can be sure that the encoding is wrong.

Valid parameters for postgres-s3-backup
- SCHEDULE: '@daily'  *** set the schedule for the cronjob to run at e.g ' 0 0 */1 * *' will run every day at 00 : 00
  S3_REGION: region *** which region is the S3 bucket set
  S3_ACCESS_KEY_ID: key *** the access key id to the S3 bucket that you have (NOTE should be provided from a secret, DO NOT PUSH THIS TO A PUBLIC REPO)
  S3_SECRET_ACCESS_KEY: secret *** the secret access key to the S3 bucket (NOTE should be provided from a secret, DO NOT PUSH THIS TO A PUBLIC REPO)
  S3_BUCKET: my-bucket *** set the bucket name in order to know where the buckups should be saved
  S3_PREFIX: backup *** (optional) if you want to create a folder that you want to store your backups in, you will use prefix for such a use case
  POSTGRES_DATABASE: dbname *** specifies the database name that will be backedup 
  POSTGRES_USER: user *** the username you use to access the postgres database
  POSTGRES_PASSWORD: password *** the password that you use enter the database (NOTE should be provided from a secret, DO NOT PUSH THIS TO A PUBLIC REPO)
  POSTGRES_EXTRA_OPTS: '--schema=public --blobs' *** specifies any extra options that you might want to pass
  POSTGRES_HOST: host *** specify the host of the postgres database pod that holds the postgres database data

********
NOTE - do not push your files that contain the secret keys to a repo especially if it is a public repo. This is dangerous as someonem might find your secret keys and use it for the wrong purpose.
