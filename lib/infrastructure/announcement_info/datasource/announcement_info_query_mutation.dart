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
        pageInfo {
          endCursor
        }
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
              manufacturer:field(name:"Manufacturer")
              {
              ...textFields
              }
              source:field(name:"Source")
              {
              ...textFields
              }
              content:field(name:"Content")
              { 
                ...richTextFields
              }
              thumbnail:field(name:"Thumbnail")
              { 
                ...imageFields
              }
              publishedDate: field(name:"Published Date")
              {
                ...dateFields
              }
              documents: field(name: "Documents") {
                ...multilistFieldsAnnouncements
              }
              tag: field(name: "Tag") {
                ...lookupFields
              }
            }
    }
    fragment multilistFieldsAnnouncements on MultilistField {
      value: targetItems {
        url {
          value: url
        }
      }
    }
    fragment lookupFields on LookupField {
      value: targetItem {
        name
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
    fragment richTextFields on RichTextField 
    {
      value
    }
    ''';
  }

  String getAnnouncementInfoDetailsQuery() {
    return '''
    query (\$itemId: String!, \$lang: String!) {
      item(path: \$itemId, language: \$lang) {
        id
        title: field(name: "Title") {
          ...textFields
        }
        content: field(name: "Content") {
          ...richTextFields
        }
        summary: field(name: "Summary") {
          ...textFields
        }
        thumbnail: field(name: "Thumbnail") {
          ...imageFields
        }
        publishedDate: field(name: "Published Date") {
          ...dateFields
        }
        documents: field(name: "Documents") {
          ...multilistFields
        }
        manufacturer: field(name: "Manufacturer") {
          ...textFields
        }
        source: field(name: "Source") {
          ...textFields
        }
        tag: field(name: "Tag") {
          ...lookupFields
        }
        ...itemDetail
      }
    }

    fragment itemDetail on Item {
      ... on Announcement {
        id
        title: field(name: "Title") {
          ...textFields
        }
        content: field(name: "Content") {
          ...richTextFields
        }
        summary: field(name: "Summary") {
          ...textFields
        }
        thumbnail: field(name: "Thumbnail") {
          ...imageFields
        }
        publishedDate: field(name: "Published Date") {
          ...dateFields
        }
        documents: field(name: "Documents") {
          ...multilistFields
        }
        manufacturer: field(name: "Manufacturer") {
          ...textFields
        }
        source: field(name: "Source") {
          ...textFields
        }
        tag: field(name: "Tag") {
          ...lookupFields
        }
      }
    }

    fragment textFields on TextField {
      value
    }

    fragment richTextFields on RichTextField {
      value
    }

    fragment dateFields on DateField {
      isoValue: value
    }

    fragment imageFields on ImageField {
      src
    }

    fragment multilistFields on MultilistField {
      value: targetItems {
        url {
          value: url
        }
      }
    }

    fragment lookupFields on LookupField {
      value: targetItem {
        id
        name
        displayName
      }
    }
    ''';
  }
}
