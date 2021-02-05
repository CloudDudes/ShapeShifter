exports.lambdaHandler = async (event, context) => {
    console.log('Got on input', {
        event,
        context
    })
    return {
        'statusCode': 200,
        'body': JSON.stringify({
            message: 'lambda response',
        }),
        'headers': {
            'Content-Type': 'application/json; charset=utf-8'
        }
    }
};
