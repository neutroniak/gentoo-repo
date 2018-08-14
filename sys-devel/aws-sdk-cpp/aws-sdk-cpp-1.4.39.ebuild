# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils eutils

DESCRIPTION="AWS SDk CPP version"
HOMEPAGE="https://github.com/aws/aws-sdk-cpp"
SRC_URI="https://github.com/aws/aws-sdk-cpp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="-access-management -acm -acm-pca -alexaforbusiness -apigateway -application-autoscaling -appstream -appsync -athena -autoscaling -autoscaling-plans -AWSMigrationHub -batch -budgets -ce -cloud9 -clouddirectory -cloudformation -cloudfront -cloudhsm -cloudhsmv2 -cloudsearch -cloudsearchdomain -cloudtrail -codebuild -codecommit -codedeploy -codepipeline -codestar -cognito-identity -cognito-idp -cognito-sync -comprehend -config -connect -cur -datapipeline -dax -devicefarm -directconnect -discovery -dlm -dms -ds -dynamodb -ec2 -ecr -ecs -eks -elasticache -elasticbeanstalk -elasticfilesystem -elasticloadbalancing -elasticloadbalancingv2 -elasticmapreduce -elastictranscoder -email -es -events -firehose -fms -gamelift -glacier -glue -greengrass -guardduty -health -iam -identity-management -importexport -inspector -iot -iot1click-devices -iot1click-projects -iotanalytics -iot-data -iot-jobs-data -kinesis -kinesisanalytics -kinesisvideo -kinesis-video-archived-media -kinesis-video-media -kms -lambda -lex -lex-models -lightsail -logs -machinelearning -macie -marketplacecommerceanalytics -marketplace-entitlement -mediaconvert -medialive -mediapackage -mediastore -mediastore-data -mediatailor -meteringmarketplace -mobile -mobileanalytics -monitoring -mq -mturk-requester -neptune -opsworks -opsworkscm -organizations -pi -pinpoint -polly -polly-sample -pricing -queues -rds -redshift -rekognition -resource-groups -resourcegroupstaggingapi -route53 -route53domains -s3 -sagemaker -sagemaker-runtime -sdb -secretsmanager -serverlessrepo -servicecatalog -servicediscovery -shield -sms -snowball -sns -sqs -ssm -states -storagegateway -sts -support -swf -text-to-speech -transcribe -transfer -translate -waf -waf-regional -workdocs -workmail -workspaces -xray"

DEPEND=""

RDEPEND="${DEPEND}
	net-misc/curl
	dev-libs/openssl
"

src_prepare() {

	AWS_MODULES="$(usev access-management) $(usev acm) $(usev acm-pca) $(usev alexaforbusiness) $(usev apigateway) $(usev application-autoscaling) $(usev appstream) $(usev appsync) $(usev athena) $(usev autoscaling) $(usev autoscaling-plans) $(usev AWSMigrationHub) $(usev batch) $(usev budgets) $(usev ce) $(usev cloud9) $(usev clouddirectory) $(usev cloudformation) $(usev cloudfront) $(usev cloudhsm) $(usev cloudhsmv2) $(usev cloudsearch) $(usev cloudsearchdomain) $(usev cloudtrail) $(usev codebuild) $(usev codecommit) $(usev codedeploy) $(usev codepipeline) $(usev codestar) $(usev cognito-identity) $(usev cognito-idp) $(usev cognito-sync) $(usev comprehend) $(usev config) $(usev connect) $(usev cur) $(usev datapipeline) $(usev dax) $(usev devicefarm) $(usev directconnect) $(usev discovery) $(usev dlm) $(usev dms) $(usev ds) $(usev dynamodb) $(usev ec2) $(usev ecr) $(usev ecs) $(usev eks) $(usev elasticache) $(usev elasticbeanstalk) $(usev elasticfilesystem) $(usev elasticloadbalancing) $(usev elasticloadbalancingv2) $(usev elasticmapreduce) $(usev elastictranscoder) $(usev email) $(usev es) $(usev events) $(usev firehose) $(usev fms) $(usev gamelift) $(usev glacier) $(usev glue) $(usev greengrass) $(usev guardduty) $(usev health) $(usev iam) $(usev identity-management) $(usev importexport) $(usev inspector) $(usev iot) $(usev iot1click-devices) $(usev iot1click-projects) $(usev iotanalytics) $(usev iot-data) $(usev iot-jobs-data) $(usev kinesis) $(usev kinesisanalytics) $(usev kinesisvideo) $(usev kinesis-video-archived-media) $(usev kinesis-video-media) $(usev kms) $(usev lambda) $(usev lex) $(usev lex-models) $(usev lightsail) $(usev logs) $(usev machinelearning) $(usev macie) $(usev marketplacecommerceanalytics) $(usev marketplace-entitlement) $(usev mediaconvert) $(usev medialive) $(usev mediapackage) $(usev mediastore) $(usev mediastore-data) $(usev mediatailor) $(usev meteringmarketplace) $(usev mobile) $(usev mobileanalytics) $(usev monitoring) $(usev mq) $(usev mturk-requester) $(usev neptune) $(usev opsworks) $(usev opsworkscm) $(usev organizations) $(usev pi) $(usev pinpoint) $(usev polly) $(usev polly-sample) $(usev pricing) $(usev queues) $(usev rds) $(usev redshift) $(usev rekognition) $(usev resource-groups) $(usev resourcegroupstaggingapi) $(usev route53) $(usev route53domains) $(usev s3) $(usev sagemaker) $(usev sagemaker-runtime) $(usev sdb) $(usev secretsmanager) $(usev serverlessrepo) $(usev servicecatalog) $(usev servicediscovery) $(usev shield) $(usev sms) $(usev snowball) $(usev sns) $(usev sqs) $(usev ssm) $(usev states) $(usev storagegateway) $(usev sts) $(usev support) $(usev swf) $(usev text-to-speech) $(usev transcribe) $(usev transfer) $(usev translate) $(usev waf) $(usev waf-regional) $(usev workdocs) $(usev workmail) $(usev workspaces) $(usev xray)"

	for awsmodule in ${AWS_MODULES}; do
		buildonly=$buildonly"$awsmodule;"
	done
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_ONLY=${buildonly::-1}
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
