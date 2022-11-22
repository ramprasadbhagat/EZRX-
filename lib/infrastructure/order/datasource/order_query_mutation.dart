class OrderQueryMutation {
  /* For fetching saved order history  */
  String getSaveOrderHistory() {
    return '''
      query draftOrders(\$whereQuery: DraftOrderFilterInput, \$first: Int, \$after: Int) {
        draftOrders(first:\$first, after: \$after, filter: \$whereQuery, sort: "created_at") {
            id
            itemlist
            draftorder
            BillingDocument
            eZRxNumber
            SoldToParty
            ShipToParty
            CompanyName
            TotalOrderValue
            requestedDeliveryDate
          }
      }
   ''';
  }

  String deleteSavedOrder() {
    return '''
      mutation deleteDraftOrder(\$input: DeleteDraftOrderInput!){
        deleteDraftOrder (input :  \$input) {
        draftOrder {
          id
          __typename
        }
        }
    }
    ''';
  }

  String createSavedOrder() {
    return '''
    mutation createDraftorder(\$input: CreateDraftOrderInput!) {
      createDraftOrder(input: \$input) { 
          draftorder
          id
      }
    }
    ''';
  }
}
