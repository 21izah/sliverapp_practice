


// Response
// {
//   "bitcoin": {
//     "usd": 21865
//   }
// }

// request url
  // https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd
  // https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true


// btc-ngn rewuest url
 //  https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=ngn
 	
// Response body


// {
//   "bitcoin": {
//     "ngn": 13008100
//   }
// }

// https://api.coingecko.com/api/v3/simple/price?ids=bitcoin%2Cethereum&vs_currencies=usd%2Cngn
// {
//   "bitcoin": {
//     "usd": 28294,
//     "ngn": 13057706
//   },
//   "ethereum": {
//     "usd": 1788.96,
//     "ngn": 825603
//   }
// }

/// https://api.coingecko.com/api/v3/simple/price?ids=bitcoin%2Cethereum%2Csolana%2Clitcoin%2Ccardano&vs_currencies=usd&include_24hr_change=true
/// 
/// 
/// {
//   "bitcoin": {
//     "usd": 27083,
//     "usd_24h_change": -2.6972867754637657
//   },
//   "cardano": {
//     "usd": 0.375657,
//     "usd_24h_change": -0.862901995533137
//   },
//   "ethereum": {
//     "usd": 1867.6,
//     "usd_24h_change": -2.0800341910385187
//   },
//   "solana": {
//     "usd": 20.68,
//     "usd_24h_change": -3.129528091414327
//   }
// }