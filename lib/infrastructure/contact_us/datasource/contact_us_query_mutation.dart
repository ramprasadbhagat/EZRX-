class ContactUsQuery {
  String getContactUsQuery() {
    return '''
    query (\$itemId: String!,\$lang: String!){
  item(path: \$itemId, language: \$lang) {
   ...itemDetail
  }
}

fragment itemDetail on Item {
... on GeneralContactUs 
				{    
					id
					title:field(name:"Title")
					{
					 ...textFields
					}
					backgroundImage:field(name:"Background Image")
					{
					 ...imageFields
					} 
          content:field(name:"Content")
					{
					 ...richtextFields
					}
          preloginSendToEmail{
            value
          }
          postloginSendToEmail{
            value
          }
				}
}
fragment richtextFields on RichTextField 
{
  value
}
fragment textFields on TextField 
{
  value
}
fragment imageFields on ImageField 
{
  jsonValue
}
    ''';
  }
}
