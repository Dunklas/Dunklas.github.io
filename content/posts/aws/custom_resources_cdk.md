---
title: "Custom resources with AWS CDK"
tags: ['aws', 'cdk']
date: 2021-04-19T06:00:00Z
draft: false 
---
CloudFormation custom resources is a great way to extend the functionality of CloudFormation. With custom resources you can run any custom logic in response to stack events. Example of use cases could be to create resources which CloudFormation has no support for, make requests to some external (non AWS) API, or maybe something not related to infrastructure at all, such as running a suite of smoke tests or seeding a database.

I recently implemented a lambda-backed custom resource with AWS CDK, and the gist of it is something like below. 

```typescript
const myLambda = new Function(this, `lambda-id`, {
    runtime: Runtime.NODEJS_12_X,
    code: Code.fromAsset('path/to/code/'),
    handler: 'index.handler'
});

const provider = new Provider(this, 'custom-resource-provider-id', {
    onEventHandler: myLambda,
    logRetention: logs.RetentionDays.ONE_DAY
});
```
My understanding is that the `Provider` is the layer between CloudFormation and the lambda function. It listens to notifications from CloudFormation and deliver responses from the lambda function back to CloudFormation.

To actually use the the custom resource, you'll need to include a `CustomResource` with a service token from the `Provider`, like below. I think the service token is what tells CloudFormation about where requests should be sent, but I'm not sure how this is implemented in the `@aws-cdk/custom-resources.Provider` construct.
```typescript
new CustomResource(this, `custom-resource-id`, {
    serviceToken: provider.serviceToken,
    properties: {
        anyProperties: 'that your lambda needs'
    },
});
```

Once the `CustomResource` has been added to a stack, the lambda function will be called for different stack events. When the resource is added to a stack, it will be called with a `Create` event. If any properties are changed, it will be called with an `Update` event. Finally, if the `CustomResource` is removed from a stack, the lambda will be called with a `Delete` event. Below is a skeleton of how you can react to these events in the lambda function.
```javascript
exports.handler = function (event, context) {
    const anyProperties = event.ResourceProperties.anyResourceProperties; 
    switch (event.RequestType) {
        case 'Create':
            // Perform create logic
        case 'Update':
            // Perform update logic
        case 'Delete':
            // Perform delete logic
    }
}
```

## Handling stack events
To respond to the stack events, your lambda function need to return a JSON object. However, for the `@aws-cdk/custom-resources.Provider` construct there are no required fields for that JSON object. If the lambda function is invoked successfully, a `SUCCESS` will be reported back to CloudFormation, and if an error is thrown a `FAILURE` will be reported.

Even though no fields are required, you should think carefully about what `PhysicalResourceId` that is returned in response to a `Create` event (if omitted, it will default to `RequestId`). This is what CloudFormation uses to identify your resource, and it will be provided in subsequent `Update` and `Delete` events.
```json
{
    "PhysicalResourceId": "an-important-id!"
}
```
It's equally important to consider what `PhysicalResourceId` that is returned in response to `Update` events. If the `PhysicalResourceId` is different from the one used during the `Create` event, CloudFormation will consider this as a resource replacement, and will emit a `Delete` event for the old custom resource. 

---

In the CustomResource that I recently implemented, the whole point of it was to manage a resource in an external (non-AWS) service. In response to the `Create` event I made a HTTP request to the external API for creation of a resource. The response from the external API included an id for my resource, which was a great fit as `PhysicalResourceId`. Since the `PhysicalResourceId` is included in the `Update` and `Delete` events, I could pick it up from the event data and make further requests to the external API for both update and delete actions.

I think there are a lot of possible use cases for custom resources?? SLUTKLÄM!!
