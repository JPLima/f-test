import boto3
import collections
import json

def gather_instance_info():
    # Initialize the EC2 client
    ec2_client = boto3.client('ec2')
    
    # Describe all instances in the region
    instances = ec2_client.describe_instances()
    
    # Initialize a dictionary to store AMI information
    ami_info = collections.defaultdict(lambda: {"ImageDescription": None,
                                                 "ImageName": None,
                                                 "ImageLocation": None,
                                                 "OwnerId": None,
                                                 "InstanceIds": []})
    
    # Iterate over reservations and instances to gather AMI and instance IDs
    for reservation in instances['Reservations']:
        for instance in reservation['Instances']:
            ami_id = instance['ImageId']
            ami_info[ami_id]['InstanceIds'].append(instance['InstanceId'])
    
    # Fetch AMI information for each AMI
    for ami_id in ami_info.keys():
        try:
            # Describe images for the AMI ID
            ami_details = ec2_client.describe_images(ImageIds=[ami_id])['Images']
            # Check if the AMI details are available
            if ami_details:
                # Populate AMI information
                ami_info[ami_id]['ImageDescription'] = ami_details[0].get('Description')
                ami_info[ami_id]['ImageName'] = ami_details[0].get('Name')
                ami_info[ami_id]['ImageLocation'] = ami_details[0].get('ImageLocation')
                ami_info[ami_id]['OwnerId'] = ami_details[0].get('OwnerId')
        except Exception as e:
            # Print error message if fetching details fails
            print(f"Error fetching details for AMI {ami_id}: {str(e)}")
    
    return ami_info

def main():
    # Gather instance and AMI information
    instance_info = gather_instance_info()
    # Print the information as JSON
    print(json.dumps(instance_info, indent=2))

if __name__ == "__main__":
    main()
