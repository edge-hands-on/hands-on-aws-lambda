console.log('Loading function');

exports.handler = async (event, context) => {
    console.log('Received event: ', JSON.stringify(event, null, 4));
    return {
        "isBase64Encoded": false,
        "statusCode": 200,
        "body": event
    };
};
