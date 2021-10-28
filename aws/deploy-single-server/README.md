# terraform-templates
This repository contains templates to create infrastructure using terraform and aws

## Setting up the AWS CLI

1. Installing the CLI
```
# curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
# installer -pkg AWSCLIV2.pkg -target /
# which aws
# aws --version

aws-cli/2.2.46 Python/3.8.8 Darwin/20.6.0 exe/x86_64 prompt/off
```

2. Configure the CLI

```
# aws configure

AWS Access Key ID [None]: *****
AWS Secret Access Key [None]: *****
Default region name [None]: 
Default output format [None]: 

```

3. Verify the AWS Credentials and Config files

```
# ls ~/.aws

config          credentials
```

4. Set the environment variable for AWS Cli to use the credentials declared in the file

```
export AWS_CONFIG_FILE=~/.aws/credentials
```