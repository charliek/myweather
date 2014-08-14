# Example packer images

The build.json file contains an example of how you can burn an ebs and instance
backed ami. You can run the image by changing to the directory hosting this read
me and running:

```bash
packer build -var-file=your_ec2_config.json" build.json
```

Note that your `your_ec2_config.json` will need to look something like:

```json
{
  "aws_access_key": "YOUR AWS ACCESS KEY",
  "aws_secret_key": "YOUR AWS SECRET KEY",
  "aws_account_id": "YOUR AWS ACCOUNT ID",
  "aws_x509_cert_path": "PATH TO YOU AWS CERT PATH (cert-xyx.pem)",
  "aws_x509_key_path": "PATH TO YOU AWS CERT PATH (pk-xyx.pem)",
  "aws_s3_bucket": "BUCKET NAME TO PUSH INSTANCE BACKED IMAGES (This must reside in same region images are being burned)"
}
```

The ebs images require less to be specified, but to do both image types you will
need to provide all of this info.

Also in order to build in your environment you may want/need to add to the build.json file (i.e. VPC identifier),
but hopefully these are reasonable defaults.

See all of the opitons in the [packer documentation](http://www.packer.io/docs/builders/amazon.html).
