# EC2 Instance and AMI Info Script

This script gathers information about all instances in the current AWS region and organizes them by the AMIs they are using. It then fetches details for each AMI and formats the output as a JSON object.

## Requirements

- Python 3.x
- Boto3 library

## Installation


1. Install the required dependencies using pip:

```bash
    pip install -r requirements.txt
´´´



## Usage

Run the script using the following command:

```bash
    python ec2_info_by_ami.py
´´´


Ensure that AWS credentials are properly configured on your system.
