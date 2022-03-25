VALUE_FILE=values.yaml

# content-crawler
yq -i ".content-crawler.image.repository = \"${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/dnsbelgium/mercator/content-crawler\"" ${VALUE_FILE}
yq -i ".content-crawler.database.url = \"jdbc:postgresql://$(terraform output -raw db_instance_address):5432/postgres?currentSchema=content_crawler\"" ${VALUE_FILE}
yq -i ".content-crawler.database.username = $(terraform output db_instance_username)" ${VALUE_FILE}
yq -i ".content-crawler.database.password = $(terraform output db_instance_password)" ${VALUE_FILE}
yq -i ".content-crawler.serviceAccount.annotations.\"eks.amazonaws.com/role-arn\" = $(terraform output iam_role_arn)" ${VALUE_FILE}

# dispatcher
yq -i ".dispatcher.image.repository = \"${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/dnsbelgium/mercator/dispatcher\"" ${VALUE_FILE}
yq -i ".dispatcher.database.url = \"jdbc:postgresql://$(terraform output -raw db_instance_address):5432/postgres?currentSchema=dispatcher\"" ${VALUE_FILE}
yq -i ".dispatcher.database.username = $(terraform output db_instance_username)" ${VALUE_FILE}
yq -i ".dispatcher.database.password = $(terraform output db_instance_password)" ${VALUE_FILE}
yq -i ".dispatcher.serviceAccount.annotations.\"eks.amazonaws.com/role-arn\" = $(terraform output iam_role_arn)" ${VALUE_FILE}

# dns-crawler
yq -i ".dns-crawler.image.repository = \"${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/dnsbelgium/mercator/dns-crawler\"" ${VALUE_FILE}
yq -i ".dns-crawler.database.url = \"jdbc:postgresql://$(terraform output -raw db_instance_address):5432/postgres?currentSchema=dns_crawler\"" ${VALUE_FILE}
yq -i ".dns-crawler.database.username = $(terraform output db_instance_username)" ${VALUE_FILE}
yq -i ".dns-crawler.database.password = $(terraform output db_instance_password)" ${VALUE_FILE}
yq -i ".dns-crawler.geoip.key = \"${DNS_MAXMIND_KEY}\"" ${VALUE_FILE}
yq -i ".dns-crawler.serviceAccount.annotations.\"eks.amazonaws.com/role-arn\" = $(terraform output iam_role_arn)" ${VALUE_FILE}

# feature-extraction
yq -i ".feature-extraction.image.repository = \"${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/dnsbelgium/mercator/feature-extraction\"" ${VALUE_FILE}
yq -i ".feature-extraction.database.url = \"jdbc:postgresql://$(terraform output -raw db_instance_address):5432/postgres?currentSchema=feature_extraction\"" ${VALUE_FILE}
yq -i ".feature-extraction.database.username = $(terraform output db_instance_username)" ${VALUE_FILE}
yq -i ".feature-extraction.database.password = $(terraform output db_instance_password)" ${VALUE_FILE}
yq -i ".feature-extraction.database.content_crawler.url = \"jdbc:postgresql://$(terraform output -raw db_instance_address):5432/postgres?currentSchema=content_crawler\"" ${VALUE_FILE}
yq -i ".feature-extraction.serviceAccount.annotations.\"eks.amazonaws.com/role-arn\" = $(terraform output iam_role_arn)" ${VALUE_FILE}

# ground-truth
yq -i ".ground-truth.image.repository = \"${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/dnsbelgium/mercator/ground-truth\"" ${VALUE_FILE}
yq -i ".ground-truth.database.url = \"jdbc:postgresql://$(terraform output -raw db_instance_address):5432/postgres?currentSchema=ground_truth\"" ${VALUE_FILE}
yq -i ".ground-truth.database.username = $(terraform output db_instance_username)" ${VALUE_FILE}
yq -i ".ground-truth.database.password = $(terraform output db_instance_password)" ${VALUE_FILE}
yq -i ".ground-truth.serviceAccount.annotations.\"eks.amazonaws.com/role-arn\" = $(terraform output iam_role_arn)" ${VALUE_FILE}

# mercator-api
yq -i ".mercator-api.image.repository = \"${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/dnsbelgium/mercator/mercator-api\"" ${VALUE_FILE}
yq -i ".mercator-api.database.url = \"jdbc:postgresql://$(terraform output -raw db_instance_address):5432/postgres?currentSchema=\"" ${VALUE_FILE}
yq -i ".mercator-api.database.username = $(terraform output db_instance_username)" ${VALUE_FILE}
yq -i ".mercator-api.database.password = $(terraform output db_instance_password)" ${VALUE_FILE}
yq -i ".mercator-api.serviceAccount.annotations.\"eks.amazonaws.com/role-arn\" = $(terraform output iam_role_arn)" ${VALUE_FILE}

# mercator-ui
yq -i ".mercator-ui.image.repository = \"${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/dnsbelgium/mercator/mercator-ui\"" ${VALUE_FILE}

# mercator-wappalyzer
yq -i ".mercator-wappalyzer.image.repository = \"${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/dnsbelgium/mercator/mercator-wappalyzer\"" ${VALUE_FILE}
yq -i ".mercator-wappalyzer.serviceAccount.annotations.\"eks.amazonaws.com/role-arn\" = $(terraform output iam_role_arn)" ${VALUE_FILE}

# muppets
yq -i ".muppets.image.repository = \"${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/dnsbelgium/mercator/muppets\"" ${VALUE_FILE}
yq -i ".muppets.s3_bucket = $(terraform output muppets_bucket)" ${VALUE_FILE}
yq -i ".muppets.serviceAccount.annotations.\"eks.amazonaws.com/role-arn\" = $(terraform output iam_role_arn)" ${VALUE_FILE}

# smtp-crawler
yq -i ".smtp-crawler.image.repository = \"${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/dnsbelgium/mercator/smtp-crawler\"" ${VALUE_FILE}
yq -i ".smtp-crawler.database.url = \"jdbc:postgresql://$(terraform output -raw db_instance_address):5432/postgres?currentSchema=smtp_crawler\"" ${VALUE_FILE}
yq -i ".smtp-crawler.database.username = $(terraform output db_instance_username)" ${VALUE_FILE}
yq -i ".smtp-crawler.database.password = $(terraform output db_instance_password)" ${VALUE_FILE}
yq -i ".smtp-crawler.geoip.key = \"${DNS_MAXMIND_KEY}\"" ${VALUE_FILE}
yq -i ".smtp-crawler.serviceAccount.annotations.\"eks.amazonaws.com/role-arn\" = $(terraform output iam_role_arn)" ${VALUE_FILE}

# ssl-crawler
yq -i ".ssl-crawler.image.repository = \"${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/dnsbelgium/mercator/ssl-crawler\"" ${VALUE_FILE}
yq -i ".ssl-crawler.database.host = $(terraform output db_instance_address)" ${VALUE_FILE}
yq -i ".ssl-crawler.database.username = $(terraform output db_instance_username)" ${VALUE_FILE}
yq -i ".ssl-crawler.database.password = $(terraform output db_instance_password)" ${VALUE_FILE}
yq -i ".ssl-crawler.serviceAccount.annotations.\"eks.amazonaws.com/role-arn\" = $(terraform output iam_role_arn)" ${VALUE_FILE}

# vat-crawler
yq -i ".vat-crawler.image.repository = \"${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/dnsbelgium/mercator/vat-crawler\"" ${VALUE_FILE}
yq -i ".vat-crawler.database.url = \"jdbc:postgresql://$(terraform output -raw db_instance_address):5432/postgres?currentSchema=vat_crawler\"" ${VALUE_FILE}
yq -i ".vat-crawler.database.username = $(terraform output db_instance_username)" ${VALUE_FILE}
yq -i ".vat-crawler.database.password = $(terraform output db_instance_password)" ${VALUE_FILE}
yq -i ".vat-crawler.serviceAccount.annotations.\"eks.amazonaws.com/role-arn\" = $(terraform output iam_role_arn)" ${VALUE_FILE}

# VPC
yq -i ".global.vpc.db_cidr = $(terraform output -json vpc_database_cidr_blocks)" ${VALUE_FILE}
yq -i ".global.vpc.endpoint_cidr = $(terraform output -json vpc_private_cidr_blocks)" ${VALUE_FILE}

