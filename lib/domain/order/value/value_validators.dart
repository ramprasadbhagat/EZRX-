bool materialBundleTypeIsPercent(String bundleType) {
  return bundleType == '%';
}

bool materialTaxClassificationIsNoTax(String taxClassification) {
  return taxClassification == 'noTax';
}

bool materialTaxClassificationIsExempt(String taxClassification) {
  return taxClassification == 'Exempt';
}

bool materialTaxClassificationIsFullTax(String taxClassification) {
  return taxClassification == 'Product : Full Tax';
}

bool havingSubmitPrincipleForClient(String principleCode) {
  return principleCode == '100822';
}

bool havingSubmitPrincipleForSalesRep(String principleCode) {
  return principleCode == '100225';
}
