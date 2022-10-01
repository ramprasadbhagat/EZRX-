// This class is responsible for all the queries for the GraphQl
// for fetching the data from the APIs and the params are mentioned
// in each and every query we require for the functionality

class FavouriteQueryMutation {
  String deleteFavourite() {
    return ''' 
    mutation deleteFavouriteMaterial(\$input: DeleteFavouriteMaterialInput
!){
        deleteFavouriteMaterial (input :  \$input
         ) {
          id
        }
    }
    ''';
  }

  String addFavourite() {
    return '''
    mutation createFavouriteMaterial(\$input: CreateFavouriteMaterialInput!) {
        createFavouriteMaterial(input: \$input) {
            id
        }
    }
    ''';
  }

  String getFavourite() {
    return ''' 
  query favouriteMaterials (\$user: Int)
  {  
      favouriteMaterials (where: {user: \$user}
      sort: "created_at"){
          id
          materialNumber
          materialDescription 
          isFOC
          isTenderContract
      }
    }
    ''';
  }
}
