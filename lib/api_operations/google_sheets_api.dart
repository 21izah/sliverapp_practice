import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi {
  // create credentials
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "cza-exchange",
  "private_key_id": "aa1394bd32b5839d7584a6eed1c6127af2868195",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCcpoyoQK0JlQKT\n5z1sU7Y1x6JvjVOqUrngVbGoyCWdTuRg0DR7pyZA+EzpQbStF7SQo4ooFJ1TZSLN\nS8mvjlVuYqq1ums3/+FfApns/CJ6iOsK1DEuEyFtYbkmysbA06G6rtkfP8i92k91\nvXE1gsQ/UPowhI5iul5cryCRDblSKn7RUfWwoEZDvnOO69O7BcxbTCWh6khLvWKI\nVVykG2EScnhtpYUEYYiLWokVFrS1K9NFfzxnAorfQi8uurtODp1YRA2GFE2YG1+0\nyV8X6MzjhQ3vz1+QE7jhmVzyLGYx1HyLMJvIzOktLRahvbdqek5AhdPrWatvTTpu\nNFLpc05fAgMBAAECggEAQpaBX9vuMg6HQ/udnniPEZlEsQpwMAxuOq/yjv5VDuNE\nLOsUBCPvHNrvRo/Jj3JuLLV3usXYgmSRQJcgqmFka0HBsvIFNY6tbEecyqH6vf+J\nedbs+Nrk8KwDmjvD9J+BNeuxG5lvaVRtRm06vDZT2V5Am3MdW1ZBWkCPJVmiFwyS\nj7/fAUpBM8Vu1exzVkx7zABNKSuf64f+fKpmp7cUUQSgrcRYZFKBodJ7KymuO1v5\np4DU2mbPo30sH2Tyoxo0zM+WbTC87ErDmyL7qAJPinA6aCDwGeqf1krYdJz0Q4yu\nqUrizMO7hDBG6EAcrQ5i8n2Wn4QgZWRYYEqBn+sksQKBgQDYNisS+BZZ6OCTDAfC\nlc+00e9nOilpReOpKUN8YXEa2XwxG3LiBfgBcPvLnYxPHy6+XgF63yEwW39iD8kT\nY8xDu2A3D5XazFsxJ0eeTCuJh7buRETrmcDJWu91BOA9h6X2m1ePnx2y7eDr7PvY\nfdyveejxQi+iYiEJbzniRoVMqwKBgQC5em71+Ka38CJsv5WrVm6DrHcR8T0oZjZD\nBf9WgmMlyGadBLPuUqcnFqgQGhN0OW4x0bB6gNggghAIdhGPulsgMBCY8QP4YgBT\nQaIccUKbOKqzI6cyDCt6dlZBsc9zJmC2zoM8SDT4muZkhXV/dBO0awtLtF5S/olD\nrnhyV37dHQKBgQCVaXGAzVJc1ZKD65ddP7vmoAEJ2+aMKlD2MF7DkG7h+BNbuDU+\nvpMxI8vNXNV+Q/VAdqQdLh64VTKFKJVywc+BqvYFds6/AeOu5w8V9FtN0ix3IVRj\nX8AbJa0+t5ziyF/HOHhc9r9GTB7XytALPocH+H4iYvOaCqf75hIhLUymuwKBgQCU\nKbl5w6dqR+k39dMZi3G8vYhgTNUN8Jhn8eKGuKF7DRrrU1Zoip38G50lP69KqJXe\nNiNDuKjtTvh/ydE9fyBMFhksE1uYjrCz0Toufks2s42ojFKDKDWTHfTJhcCxu3aG\nkXFENmoaLaLdqb6ykYcsGFZtoye2JJ6B8l1E+Z/eAQKBgHdhucOdZeREGPpggNdI\ntvjTdQiWw5NYcjgZWKGsEohRv+NPP7K/8R0TR9mX3q22yEjoBujcN/+ZPTBQWqs6\nrAblUqxzo61dDafEiu1yBiySks2EyL6zOCs+jKwfj79xj9UN2YTitnzP6d77bIHN\n7pKjTksVQfuZgOnCBgAOd5PC\n-----END PRIVATE KEY-----\n",
  "client_email": "cza-exchange@cza-exchange.iam.gserviceaccount.com",
  "client_id": "108027308712236064918",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/cza-exchange%40cza-exchange.iam.gserviceaccount.com"
}
''';

//set up & connect to the spreadsheet
  static const _spreadsheetId = '1xGWlClghbKtUycNaXmdw_juI5hpyb_IGGH99AI_4kfk';
  static final gsheets = GSheets(_credentials);
  static Worksheet? _worksheet;

  //initialize the spreadsheet!

  Future init() async {
    final ss = await gsheets.spreadsheet(_spreadsheetId);
    _worksheet = ss.worksheetByTitle('WorkSheet1');
    postRates();
    getRates();
  }

  // post rates to google sheets
  static Future postRates() async {
    // update cell at 'B2' by inserting string 'new'
    await _worksheet!.values.insertValue('750', column: 2, row: 2);
  }

  // get rates from google sheets
  static Future getRates() async {
    // get cell at 'B2' as Cell object
    await _worksheet!.cells.cell(column: 2, row: 2);
  }
}
