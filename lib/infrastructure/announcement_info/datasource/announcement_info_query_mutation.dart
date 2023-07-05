class AnnouncementInfoQueryMutation {
  String getAnnouncementInfoQuery() {
    return '''
    query(\$pageSize: Int!,\$template: String!, \$path : String!, \$lang : String!, \$after:String) {
      search(
        where: {
          AND: [
            {
              name: "_templates"
              value: \$template
              operator: CONTAINS
            }
            {
              name: "_path"
              value: \$path
              operator: CONTAINS
            }
            {
              name: "_language"
              value: \$lang
              operator: CONTAINS
            }
          ]
        }
        first: \$pageSize
        after:\$after
        orderBy: { name: "Published Date", direction: DESC }
      ) {
        total
        results {
        ...itemDetail
        }
      
      }
    }

    fragment itemDetail on Item {
    ... on Announcement 
            {    
              id
              title:field(name:"Title")
              {
              ...textFields
              }
              summary:field(name:"Summary")
              {
              ...textFields
              }
              thumbnail:field(name:"Thumbnail")
              { 
                ...imageFields
              }
              publishedDate: field(name:"Published Date")
              {
                ...dateFields
              } 
            }
    }
    fragment textFields on TextField 
    {
      value
    }
    fragment dateFields on DateField 
    {
      isoValue:value
    }
    fragment imageFields on ImageField 
    {
      src
    }
    ''';
  }
}
