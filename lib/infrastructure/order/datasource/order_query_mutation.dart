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

  String submitOrder() {
    return '''
    mutation submitOrderMutation(\$NewOrderInput: NewOrderInputSecure!) {
      submitOrder(order: \$NewOrderInput) {
        SalesDocument
        Messages {
          Type
          Message
        }
      }
    }
    ''';
  }

  String getSavedOrderDetail() {
    return '''
      query getSavedOrderDetail(\$id: Int!) {
      draftOrder(id: \$id) {
        id
        DeliveryDocument
        itemlist
        SoldToParty
        ShipToParty
        address1
        address2
        post_code1
        phonenumber
        orderType
        orderReason
        shippingCondition
        contactPerson
        city
        POReference
        requestedDeliveryDate
        orderRequest
        collectiveNumber
        referenceNote
        POAttachent
        paymentTerm
        __typename
      }
    }
   ''';
  }

  String updateSavedOrder() {
    return '''
    mutation updateDraftorder(\$input: UpdateDraftOrderInput!) {
      updateDraftOrder(input: \$input) { 
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
}
