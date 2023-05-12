class SubmitReturnRequestMutation {
  String getReturnRequestMutation() {
    return '''
    mutation addRequestV2(\$returnInput: returnInput!) {
       addRequestV2(input: \$returnInput) {
       requestID
       messages {
        childRequestID
        message {
         type
         number
         message
      }
    }
  }
}
''';
  }
}
