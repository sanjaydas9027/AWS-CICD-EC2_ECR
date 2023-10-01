# CI/CD Project using AWS CodeBuild, CodeDeploy, and CodePipeline on EC2 & ECR

## Overview

This project demonstrates a Continuous Integration and Continuous Deployment (CI/CD) pipeline using AWS services, including AWS CodeBuild, AWS CodeDeploy, and AWS CodePipeline, to automate the deployment of a Python Flask application stored on GitHub to an Amazon Elastic Container Registry (ECR) and then deploy it to an EC2 instance. The pipeline involves building a Docker image, pushing it to ECR, and deploying the application on an EC2 instance.

## Flow

1. **Source Phase**:
   - A Python Flask application is stored on GitHub.
   - GitHub webhook triggers the pipeline on code changes.

2. **Build Phase (AWS CodeBuild)**:
   - AWS CodeBuild is used to build the application.
   - A `buildspec.yml` file specifies the build process.
   - Secrets are retrieved from AWS Systems Manager Parameter Store to securely access resources.
   
3. **Artifact Storage (AWS S3)** (optional):
   - You can optionally store build artifacts in an S3 bucket for later use.

4. **Docker Image Creation**:
   - The application is containerized using Docker.

5. **ECR Push (Amazon Elastic Container Registry)**:
   - The Docker image is pushed to a private ECR repository.

6. **Deployment Phase (AWS CodeDeploy)**:
   - An EC2 instance is used as the deployment target.
   - The EC2 instance is prepared by installing necessary components:
     - CodeDeploy agent
     - Docker
     - AWS CLI
   - The CodeDeploy deployment group is set to "Never" for automatic agent installation.

7. **Deployment from ECR**:
   - CodeDeploy on the EC2 instance logs in to ECR using IAM roles and pulls the Docker image.
   - The application container is run on the EC2 instance.

8. **Security Group Configuration**:
   - Security group rules are configured to allow access to the application ports.

## IAM Roles

### EC2 Role
- Service: EC2
- Attached Policies:
  - AmazonEC2ContainerRegistryFullAccess
  - AmazonEC2FullAccess
  - AmazonS3FullAccess
  - AWSAppRunnerServicePolicyForECRAccess
  - AWSCodeDeployFullAccess
  - EC2InstanceProfileForImageBuilderECRContainerBuilds
  - SecretsManagerReadWrite

### CodeDeploy Role
- Service: CodeDeploy
- Attached Policies:
  - AmazonEC2FullAccess
  - AmazonEC2RoleforAWSCodeDeploy
  - AmazonEC2RoleforAWSCodeDeployLimited
  - AmazonS3FullAccess
  - AWSCodeDeployDeployerAccess
  - AWSCodeDeployFullAccess
  - AWSCodeDeployRole
  - AWSCodeDeployRoleForCloudFormation

### CodeBuild & CodePipeline Role
- When creating resources for CodeBuild and CodePipeline, select "Create new role."
- Attach policies as needed.

## CodeBuild Configuration

- Create a CodeBuild project.
- Use a `buildspec.yml` file to define the build process.

## CodeDeploy Configuration

- Select "EC2" as the runtime environment.
- In the deployment group, select "Never" for automatic CodeDeploy agent installation on EC2 instances.

## EC2 CodeDeploy Agent Setup

- Create an EC2 instance.
- Update the EC2 instance's IAM role to include the necessary permissions.
- Install the CodeDeploy agent, Docker, and AWS CLI on the EC2 instance.
- Log in to ECR from the EC2 instance.

## CodePipeline

- Set up a CodePipeline to orchestrate the entire CI/CD process.

## Monitoring with CloudWatch

- Monitor and configure logging for better visibility into the pipeline.
- monitored cloudwatch insights




