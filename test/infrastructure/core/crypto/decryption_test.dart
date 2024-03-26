import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/crypto/decryption.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final config = Config()..appFlavor = Flavor.mock;
  final mockOrderDecrypted = {
    'NewOrderInput': {
      'username': 'rootadmin',
      'Holidays': '{}',
      'CustomerHolidays':
          '{"monday":false,"tuesday":false,"wednesday":false,"thursday":false,"friday":false,"saturday":false,"sunday":false}',
      'customer': {
        'customerNumber': '0030082707',
        'customerNumberShipTo': '0070149863',
        'salesOrganisation': '2001',
        'division': '00',
      },
      'materials': [
        {
          'materialNumber': '000000000021041773',
          'qty': 15,
          'price': 20.4,
          'tax': 0,
          'bonuses': [
            {
              'materialNumber': '000000000021041773',
              'qty': 2,
              'PromoStatus': false,
              'PromoType': '',
            }
          ],
          'ProductType': 'MATERIAL',
          'ParentID': '000000000021041773',
          'Comment': '',
          'Mrp': 20.4,
          'PromoStatus': true,
          'PromoType': '',
          'isCounterOffer': false,
          'principalCode': '0000101334',
          'principalName': 'GLAXOSMITHKLINE CONSUMER',
          'Description': '190 BIOTENE D/MOUTHT/PASTE FM ORI 4.5OZ',
        }
      ],
      'blockOrder': false,
      'orderValue': 306,
      'totalTax': 0,
      'PODate': '2023-12-14',
      'companyName': '',
      'SpecialInstructions': '',
      'paymentMethod': 'Bank Transfer',
      'language': 'EN',
      'POReference': '',
      'RequestedDeliveryDate': '',
      'paymentTerms': '0001',
      'CollectiveNumber': '',
      'referenceNotes': '',
      'poDocuments': [],
      'Telephone': '',
      'deliveryFee': 'undefined',
      'PurchaseOrderType': 'DSS',
    },
  };

  group(
    'Decryption',
    () {
      late Decryption decryption;

      setUp(() {
        decryption = Decryption();
      });

      test('Decryption Data', () async {
        const dataEncrypted =
            '53616c7465645f5fc43ab15f2f89a2de95b0584241d3a13c8f362f7a3f381aed';

        expect(decryption.decrypt(dataEncrypted), '0');
      });

      test(
        'Order decryption',
        () async {
          const dataEncrypted =
              'b5458710d3cea8263ff3008f0a5d9c5abb71d09bd070a7fb1a93956494f8f04d6689f26670fb3d55423bb7b5931872da011a9e312c45d9cd4028588caacd40755a1fe2908119ddf98c5efbe30ecfeef82c3a2bdb8070f705c6bfee765cb717601df6a11d5a8c668f59d852c8953c08fd42b91e7ae224eeb1483411f2af9526d98c70a6605967ba901e261797c76cd7057fa14c1606f8ad2c3c42a692173cb043558db0c7d2e91aca7ff742a2dcc41def5a5a8b7f531ef4d86145a01a15dfbe2fc9e7e8b9500130638a201a11bd37f9f24eaa37dba48e079bb7029886aae2d37373631c5eb05e095ed236670bbb2d25b076010e0ff39b3a239b57ec9011f1943d548fc25339c88eb82f0f0908805d99fc0e80de14ea6c8264e3325b3c52c90eefe36db4cdad9a93e1caf74dcf8e524f912d5519244282e0c6b093713cd2ac5fd2c33f92aca34d223da99811a17fef329e86594045d0b0f41b218f9a297daa417fc983084c98071a6bad3fabe4e358c0545edc01c6508d5213478257545f447fe7de14855b153304fd18cc17b6dd1ea5d128df84013c6ddc9f7adfe291cb89d6b6282ba48db77469b6d58d93eb9c5c4d922e7196e4ac5a7f80ed2d13fa7e43aedcd96e3109fb0f8e9b21873e8d4b9a94bc0b56e24c2609cc142e8c4dcb518495849bc817f047b74a6cd5f00bbd0c73a47b868025eea99268efef11efe0b513595497ad583ebd32a9ad68c8215bfb763f45a24f828e7cf859174e440afe669b38565532196f38fd86106241b41a87ba0463715bbca7b0e8fa68e2c6d19408a8b9f586beed9e6197e73ba8d5d0f251af307c16a91142cad949895eb0109a2b18ca4bc9f608eb22edfa56d327e830bd04c0514d8bfb26f57e60a390e984eb8872ae5da18120b1fe62bc1c6bb48a592d3c42ae4748c39b6b77656c82deca70d6757c229c35cb178de9534e1581b2f3276b25888d8047916a8cf3c3ccf1a08a050d93d99a5e12f178a5143d21a32565def60c74c23904ada2e0d3dbba8b76ec04018690079e8dfa2517da7eb17b0ef9274bd0e815dec3c8d3ea264528aaeb1c91fd16c3a2af0ae8f2f9ab81b547bdb3d9f00ce1b15826a214596254b4a3fdca1d3abd96d00e6a598b7ce0557e5693b1cddda6af0e71468c0a27cf2cf14893bfec130c21ea6c604cf3e9bafc68be49d23481f6690b121bdc3ac21c906cc7bf5ebe92862a14c76fcb1797ccef8db98233d2a8574fd33ed3866def9e7ddca6b95ca5821cc7a53a8e09a54d66255147dc0cfcbbb57840c87403285ed1ae3977494f5b6f876ae182f86d63c60fc87c2483c733777216cb70e133b1d6f7b1cf208481d282afa8159ba8d2d1e48b4984de4a4d0ea6413a01cac6415f7bbe1967e392d44ed3b5aaa0698cfd304293542b15c1dbc07153eb2bb043cf9938dfbbf8ac9506faa379d3274dca4a55aa9ab151156e2c62df2c250936d8c6defc375cc8b75f643e5b37429a83efe7768501daef38f212bea1d04c781ad3d68c71f0802a497780efb748665a37c7be29a606d476aff72d98a7926f35ad4365c8300c152fbe7d761cc88e74ebb0764ae179777321295176395362ab3d7a0661fedc490d7191b51809e590b6';

          final data = decryption.orderDecrypt(
            encryptedText: dataEncrypted,
            secretKey: config.orderEncryptionSecret,
          );

          expect(
            jsonDecode(data),
            mockOrderDecrypted,
          );
        },
      );
    },
  );
}
