# Infrastructure as Code

Automating "magical" using terraform to create an EC2 instance and provision the userdata via cloud-config which consists of creating a service and a timer. The timer `magical_batch_processor.timer` executes daily at 00:00:00AM (12AM) which executes the `magical_batch_processor.service`. The service executes the bash script `magical_batch_processor.sh` which simulates a download from the 3rd party provider for the file.csv, simulates a batch process which creates an output.csv and finally uploads it to an S3 bucket named `magical-files` with the current date appended to the end of the filename for both file.csv and output.csv.

Logs are stored for the script inside `/var/log/magical_batch_processor.log` which gets updated each time the script executes. This could be used for audit/diagnostic purposes i.e cloudwatch or elastic-search.

# Prerequisites
  - Amazon AWS
  - VPC (10.10.0.0/16) with an Internet Gateway attached and a public subnet
  - magical.pem - key pair used for SSH access
  - Terraform (version > v.0.11)

# Example

```
cd deployments/magical
terraform init
terraform plan
terraform apply
terraform destroy
```
