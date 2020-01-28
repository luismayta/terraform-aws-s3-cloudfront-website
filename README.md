# terraform-aws-s3-cloudfront-website

 [![Build Status](https://travis-ci.org/equipindustry/terraform-aws-s3-cloudfront-website.svg?branch=master)](https://travis-ci.org/equipindustry/terraform-aws-s3-cloudfront-website) [![Latest Release](https://img.shields.io/github/release/equipindustry/terraform-aws-s3-cloudfront-website.svg)](https://travis-ci.org/equipindustry/terraform-aws-s3-cloudfront-website/releases)


Terraform module to provision an AWS S3 Redirect.


---

This project is part of our comprehensive ["Equipindustry"](https://equipindustry.com) modules of terraform.











## Usage

```hcl
  module "main" {
    source = "github.com/equipindustry/terraform-aws-s3-cloudfront-website"

    fqdn                = var.fqdn
    ssl_certificate_arn = data.aws_acm_certificate.domain.arn
    allowed_ips         = var.allowed_ips

    index_document = "index.html"
    error_document = "404.html"

    refer_secret = "${base64sha512("REFER-SECRET-19265125-${var.fqdn}-52865926")}"

    force_destroy = "true"

    providers = {
      aws.main       = aws.main
      aws.cloudfront = aws.cloudfront
    }
  }
```

Full working example can be found in [example](./example) folder.






## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| domain | Domain name of the redirect host | string | n/a | yes |
| target | URL that should be redirected to | string | n/a | yes |
| zone\_id | Zone id | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| hosted\_zone\_id |  |
| website\_domain |  |
| website\_endpoint |  |



## Help

**Got a question?**

File a GitHub [issue](https://github.com/equipindustry/terraform-aws-s3-cloudfront-website/issues), send us an [email][email] or join our [Slack Community][slack].

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/equipindustry/terraform-aws-s3-cloudfront-website/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing this project or [help out](https://github.com/equipindustry) with our other projects, we would love to hear from you! Shoot us an [email](mailto:hola@equipindustry.com).

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to merge the latest changes from "upstream" before making a pull request!


## Copyright

Copyright © 2018-2019 [Equipindustry, LLC](https://equipindustry.com)











## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## About

This project is maintained and funded by [Equipindustry, LLC][website]. Like it? Please let us know at <hola@equipindustry.com>


### Contributors

|  [![Luis Mayta][luismayta_avatar]][luismayta_homepage]<br/>[Luis Mayta][luismayta_homepage] |
|---|

  [luismayta_homepage]: https://github.com/luismayta
  [luismayta_avatar]: https://github.com/luismayta.png?size=150
