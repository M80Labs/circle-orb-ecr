Generate() {

    echo "Creating build_info file"
    BUILD_INFO_FILE=${BUILD_INFO_FILE:-build_info.json}

    NOW=`date '+%F-T-%H-%M-%S'` # date formatted like: 2014-10-09-T-15-59-31

    printf "{
        \"date\": \"${NOW}\",
        \"branch\": \"${CIRCLE_BRANCH}\",
        \"commit\": \"${CIRCLE_SHA1}\",
        \"build_number\": \"${CIRCLE_BUILD_NUM}\"
    }" > ${BUILD_INFO_FILE}

    cat ${BUILD_INFO_FILE}

    echo "Done creating build_info file"

}

# Will not run if sourced for bats-core tests.
# View src/tests for more information.
ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Generate
fi