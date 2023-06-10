import 'package:flutter/material.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Scrollbar(
        interactive: true,
        trackVisibility: true,
        thumbVisibility: true,
        radius: Radius.circular(20),
        thickness: 10,
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // color: Colors.amber,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // color: Colors.amber,
                          constraints: BoxConstraints.expand(
                            height: screenSize.height * 0.15,
                            width: screenSize.width * 0.9,
                          ),
                          child: Text(
                            " These Terms and Conditions ('Agreement') govern the use of the crypto trading services provided by [CZA] ('Company') to its users ('Users'). By accessing and using the Company's services, Users agree to comply with and be bound by this Agreement. Please read these terms carefully before using the services.",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: screenSize.width * 0.04,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Acceptance of Terms',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints.expand(
                            height: screenSize.height * 0.15,
                            width: screenSize.width * 0.9,
                          ),
                          child: Text(
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: screenSize.width * 0.04,
                              ),
                              " By accessing or using the Company's services, Users acknowledge that they have read, understood, and agree to be bound by this Agreement. If a User does not agree with these terms, they must refrain from using the services."),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepOrange,
                            ),
                            'Eligibility '),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints.expand(
                            height: screenSize.height * 0.15,
                            width: screenSize.width * 0.9,
                          ),
                          child: Text(
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: screenSize.width * 0.04,
                              ),
                              " Users must be at least 18 years old and have legal capacity to enter into a contract to use the services. By using the services, Users represent and warrant that they meet these eligibility requirements."),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepOrange,
                            ),
                            "Registration and User Account"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints.expand(
                            height: screenSize.height * 0.15,
                            width: screenSize.width * 0.9,
                          ),
                          child: Text(
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: screenSize.width * 0.04,
                              ),
                              ' Users may be required to register and create a user account to access certain features of the services. Users agree to provide accurate and up-to-date information during the registration process. They are responsible for maintaining the confidentiality of their account credentials and agree to accept responsibility for all activities that occur under their account.'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepOrange,
                            ),
                            'Risks and Disclaimer'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints.expand(
                            height: screenSize.height * 0.15,
                            width: screenSize.width * 0.9,
                          ),
                          child: Text(
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: screenSize.width * 0.04,
                              ),
                              ' Users acknowledge and understand that cryptocurrency trading involves significant risks, including but not limited to market volatility, liquidity risks, regulatory changes, and technological risks. The Company does not provide financial or investment advice and does not guarantee the profitability or performance of any trades. Users are solely responsible for their trading decisions and should seek professional advice if needed.'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepOrange,
                            ),
                            'Compliance with Laws'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints.expand(
                            height: screenSize.height * 0.15,
                            width: screenSize.width * 0.9,
                          ),
                          child: Text(
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: screenSize.width * 0.04,
                              ),
                              ' Users agree to comply with all applicable laws, regulations, and rules related to cryptocurrency trading and financial transactions in their jurisdiction. Users are responsible for determining the legal status of cryptocurrencies in their location and ensure that their use of the services is in compliance with local laws.'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepOrange,
                            ),
                            'Prohibited Activities'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints.expand(
                            height: screenSize.height * 0.15,
                            width: screenSize.width * 0.9,
                          ),
                          child: Text(
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: screenSize.width * 0.04,
                              ),
                              ' Users agree not to engage in any illegal, fraudulent, or unauthorized activities while using the services. Prohibited activities include, but are not limited to, money laundering, terrorist financing, unauthorized access to accounts, market manipulation, and using the services for unlawful purposes'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepOrange,
                            ),
                            'Intellectual Property'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints.expand(
                            height: screenSize.height * 0.15,
                            width: screenSize.width * 0.9,
                          ),
                          child: Text(
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: screenSize.width * 0.04,
                              ),
                              " All intellectual property rights associated with the Company's services, including trademarks, logos, and content, belong to the Company. Users agree not to copy, modify, distribute, or reproduce any part of the services without the Company's prior written consent."),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepOrange,
                            ),
                            'Termination'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints.expand(
                            height: screenSize.height * 0.15,
                            width: screenSize.width * 0.9,
                          ),
                          child: Text(
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: screenSize.width * 0.04,
                              ),
                              " The Company reserves the right to suspend or terminate a User's access to the services at any time without prior notice for violation of this Agreement or any applicable laws. Users may also terminate their account by contacting the Company's support."),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepOrange,
                            ),
                            'Limitation of Liability'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // color: Colors.amber,
                          constraints: BoxConstraints.expand(
                            height: screenSize.height * 0.15,
                            width: screenSize.width * 0.9,
                          ),
                          child: Text(
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: screenSize.width * 0.04,
                              ),
                              'The Company shall not be liable for any direct, indirect, incidental, consequential, or punitive damages arising out of or in connection with the use of the services. Users agree to use the services at their own risk and waive any claims against the Company.'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepOrange,
                            ),
                            'Modification of Terms'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints.expand(
                            height: screenSize.height * 0.15,
                            width: screenSize.width * 0.9,
                          ),
                          child: Text(
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: screenSize.width * 0.04,
                              ),
                              'The Company reserves the right to modify or update these Terms and Conditions at any time without prior notice. Users are responsible for reviewing the Agreement periodically to stay informed of any changes'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepOrange,
                            ),
                            'Governing Law and Jurisdiction'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints.expand(
                            height: screenSize.height * 0.15,
                            width: screenSize.width * 0.9,
                          ),
                          child: Text(
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: screenSize.width * 0.04,
                              ),
                              'This Agreement shall be governed by and construed in accordance with the laws of [Your Jurisdiction]. Any disputes arising out of or in connection with this Agreement shall be submitted to the exclusive jurisdiction of the courts of [Your Jurisdiction].'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints.expand(
                            height: screenSize.height * 0.15,
                            width: screenSize.width * 0.9,
                          ),
                          child: Text(
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: screenSize.width * 0.04,
                              ),
                              "       By using the Company's services, Users acknowledge that they have read, understood, and agreed to these Terms and Conditions."),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
