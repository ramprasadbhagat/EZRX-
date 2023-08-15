part of 'faq_bloc.dart';

@freezed
class FaqEvent with _$FaqEvent {
  const factory FaqEvent.getFaq({
    required SalesOrg salesOrg,
    required User user,
  }) = _GetFaq;

  const factory FaqEvent.loadMoreAFaq({
    required SalesOrg salesOrg,
    required User user,
  }) = _LoadMoreFaq;
   const factory FaqEvent.filterByFaqCategory({
    required FAQCategory selectedCategory,
   
  }) = _FilterByFaqCategory;
  const factory FaqEvent.updatedSearchFaq({
    required String searchKey,
  }) = _UpdatedSearchFaq;
}
