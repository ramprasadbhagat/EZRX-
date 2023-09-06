class PoDocumentQuery {
  String getAddFileRequest() {
    return '''
    mutation AddFileRequest(\$folder: String!, \$req: [UploadFile!]!) {
      addRequestFileUpload(folder: \$folder, req: \$req) {
        id
        path
      }
    }
  ''';
  }
   String deleteFile() {
    return '''
   mutation DeleteFile(\$filePath: String!) {
      deleteFile(file: \$filePath) {
        isDeleted
      }
    }
  ''';
  }
}
