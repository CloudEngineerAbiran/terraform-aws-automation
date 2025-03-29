Terraform AWS Automation with LocalStack

Overview

This project demonstrates how to use Terraform with LocalStack to simulate AWS services locally. The setup includes creating and managing an S3 bucket using Terraform and testing operations using the AWS CLI.

Prerequisites

Ensure the following tools are installed on your system:

Homebrew (for macOS users)

Terraform (brew install terraform)

LocalStack (pip install localstack)

AWS CLI (brew install awscli)

Docker (for running LocalStack)

Setup and Usage

1. Clone the Repository
git clone https://github.com/CloudEngineerAbiran/terraform-aws-automation.git
cd terraform-aws-automation

2. Initialize Terraform

terraform init

3. Start LocalStack

localstack start -d

4. Create an S3 Bucket using Terraform

terraform apply -auto-approve

Expected output:

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
Outputs:
bucket_name = "my-local-bucket"

5. Verify S3 Bucket Creation

aws --endpoint-url=http://localhost:4566 s3 ls

6. Upload a File to LocalStack S3

echo 'Hello from LocalStack S3!' > test-file.txt
aws --endpoint-url=http://localhost:4566 s3 cp test-file.txt s3://my-local-bucket/

7. List Files in the S3 Bucket

aws --endpoint-url=http://localhost:4566 s3 ls s3://my-local-bucket/

8. Download the Uploaded File

aws --endpoint-url=http://localhost:4566 s3 cp s3://my-local-bucket/test-file.txt downloaded-test-file.txt
cat downloaded-test-file.txt

9. Destroy the Infrastructure

terraform destroy -auto-approve

If you see an error that the bucket is not empty, delete all files first:

aws --endpoint-url=http://localhost:4566 s3 rm s3://my-local-bucket --recursive
terraform destroy -auto-approve

Troubleshooting

If Terraform Apply fails, ensure LocalStack is running: localstack status

If AWS CLI commands fail, verify that AWS CLI is installed: aws --version

If Terraform shows a deprecation warning, update the provider configuration accordingly.

Contributing

Feel free to raise issues or submit pull requests to improve this project!

License

This project is licensed under the MIT License.
